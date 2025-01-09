let privateKeyCache = null;

async function getPublicKey(userId) {
    const data = await (await fetch(`get_public_key.php?receiver_id=${userId}`)).json();
    return window.crypto.subtle.importKey(
        'spki',
        Uint8Array.from(atob(data.public_key), c => c.charCodeAt(0)).buffer,
        { name: 'RSA-OAEP', hash: 'SHA-256' },
        false,
        ['encrypt']
    );
}

async function sendMessage() {
    const message = document.getElementById('message').value;
    if (!message) return;

    const [receiverId, senderId] = [
        document.querySelector('meta[name="receiver_id"]').content,
        document.querySelector('meta[name="sender_id"]').content
    ];

    const [receiverKey, senderKey] = await Promise.all([getPublicKey(receiverId), getPublicKey(senderId)]);
    const encodedMessage = new TextEncoder().encode(message);



    await fetch('store_message.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            receiver_id: receiverId,
            message: btoa(String.fromCharCode(...new Uint8Array(await window.crypto.subtle.encrypt({ name: 'RSA-OAEP' }, receiverKey, encodedMessage)))),
            sender_encrypted_message: btoa(String.fromCharCode(...new Uint8Array(await window.crypto.subtle.encrypt({ name: 'RSA-OAEP' }, senderKey, encodedMessage))))
        })
    });



    document.getElementById('message').value = '';
}

async function loadPrivateKeyFromFile() {
    const file = document.getElementById('private-key-file').files[0];
    if (!file) return;

    privateKeyCache = await window.crypto.subtle.importKey(
        'pkcs8',
        Uint8Array.from(
            atob((await file.text()).split('\n').filter(line => !line.startsWith('---')).join('')),
            c => c.charCodeAt(0)
        ).buffer,
        { name: 'RSA-OAEP', hash: 'SHA-256' },
        false,
        ['decrypt']
    );

    sessionStorage.setItem('privateKey', JSON.stringify(Array.from(new Uint8Array(privateKeyCache))));
    loadAndDecryptMessages();
}

async function restorePrivateKey() {
    const storedKey = sessionStorage.getItem('privateKey');
    return storedKey ? window.crypto.subtle.importKey(
        'pkcs8',
        Uint8Array.from(JSON.parse(storedKey)).buffer,
        { name: 'RSA-OAEP', hash: 'SHA-256' },
        false,
        ['decrypt']
    ) : null;
}



async function decryptMessage(privateKey, encryptedMessage) {
    return new TextDecoder().decode(await window.crypto.subtle.decrypt(
        { name: 'RSA-OAEP' },
        privateKey,
        Uint8Array.from(atob(encryptedMessage.trim()), c => c.charCodeAt(0))
    ));
}

async function loadAndDecryptMessages() {
    privateKeyCache = privateKeyCache || await restorePrivateKey();
    if (!privateKeyCache) return;

    const urlParams = new URLSearchParams(window.location.search);
    const receiverId = urlParams.get('receiver_id');

    if (!receiverId) return;

    const data = await (await fetch(`get_messages.php?receiver_id=${receiverId}`)).json();
    const senderId = document.querySelector('meta[name="sender_id"]').content;
    const chatBox = document.getElementById('chat-box');
    chatBox.innerHTML = '';

    for (const message of data.messages) {
        const encryptedContent = (message.sender_id == senderId) ? message.sender_encrypted_message : message.message;
        if (!encryptedContent) continue;

        chatBox.innerHTML += `
            <div class="${message.sender_id == senderId ? 'message message-sent' : 'message message-received'}">
                <strong>${message.sender_id == senderId ? 'You' : 'From User ' + message.sender_id}:</strong>
                <p>${await decryptMessage(privateKeyCache, encryptedContent)}</p>
            </div>
        `;
    }

    chatBox.scrollTop = chatBox.scrollHeight;
}

setInterval(loadAndDecryptMessages, 5000);

document.addEventListener('DOMContentLoaded', async () => {
    privateKeyCache = await restorePrivateKey();
    if (privateKeyCache) loadAndDecryptMessages();
});
