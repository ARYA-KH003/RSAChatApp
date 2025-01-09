document.getElementById('registerForm').addEventListener('submit', async function (e) {
    e.preventDefault();
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    const keyPair = await window.crypto.subtle.generateKey(
        {
            name: "RSA-OAEP",
            modulusLength: 2048,
            publicExponent: new Uint8Array([1, 0, 1]),
            hash: "SHA-256",
        },
        true,
        ["encrypt", "decrypt"]
    );

    const publicKey = await window.crypto.subtle.exportKey("spki", keyPair.publicKey);
    const publicKeyBase64 = btoa(String.fromCharCode(...new Uint8Array(publicKey)));

    const privateKey = await window.crypto.subtle.exportKey("pkcs8", keyPair.privateKey);
    const privateKeyBase64 = btoa(String.fromCharCode(...new Uint8Array(privateKey)));
    const privateKeyFile = new Blob([privateKeyBase64], { type: "text/plain" });

    const link = document.createElement('a');
    link.href = URL.createObjectURL(privateKeyFile);
    link.download = `${email}_private_key.pem`;
    link.click();

    const response = await fetch('register.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            email: email,
            password: password,
            public_key: publicKeyBase64
        })
    });

    const result = await response.json();
    document.getElementById('status').innerText = result.message;
});
