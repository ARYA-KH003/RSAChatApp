<?php
include('DBconnection.php');
session_start();

if (!isset($_SESSION['user_id']) || !isset($_GET['receiver_id'])) {
    header("Location: login.php");
    exit();
}

$sender_id = $_SESSION['user_id'];
$receiver_id = intval($_GET['receiver_id']);

$stmt = $conn->prepare("SELECT email FROM users WHERE id = ?");
$stmt->bind_param("i", $receiver_id);
$stmt->execute();
$result = $stmt->get_result();
$receiver_email = ($result && $result->num_rows > 0) ? $result->fetch_assoc()['email'] : 'Unknown User';
$stmt->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chat with <?= htmlspecialchars($receiver_email) ?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="sender_id" content="<?= $sender_id ?>">
    <meta name="receiver_id" content="<?= $receiver_id ?>">
    <link rel="stylesheet" href="chat.css">
    <script src="chat.js" defer></script>
</head>
<body>
    <header class="header">
        <nav>
            <ul class="nav-links">
                <li><a href="index.php">Home</a></li>
                <li><a href="chat_selection.php">User Selection</a></li>
                <li><a href="logout.php">Log Out</a></li>
            </ul>
        </nav>
    </header>

    <div class="AryaTel">AryaTel</div>

    <div class="chat-container">
        <h2>Chat with <?= htmlspecialchars($receiver_email) ?></h2>
        <div id="chat-box"></div>

        <form id="private-key-form">
            <label for="private-key-file">Upload Your Private Key:</label>
            <input type="file" id="private-key-file" accept=".pem">
            <button type="button" onclick="loadPrivateKeyFromFile()">Load Private Key</button>
        </form>

        <form id="send-message-form" onsubmit="event.preventDefault(); sendMessage();">
            <input type="text" id="message" placeholder="Type a message" required>
            <button type="submit">Send</button>
        </form>
    </div>
</body>
</html>
