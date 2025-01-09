<?php
include('DBconnection.php');
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$sql = "SELECT id, email FROM users WHERE id != $user_id";
$result = mysqli_query($conn, $sql);

?>
<!DOCTYPE html>
<html>
<head>
    <title>Select a User to Chat</title>
    <link rel="stylesheet" href="chat_selection.css">
</head>
<body>
<div class="AryaTel">
        <h2>AryaTel</h2>
</div>
    <h2>Select a user to chat with:</h2>
    <ul>
        <?php while ($row = mysqli_fetch_assoc($result)) : ?>
            <li>
                <a href="chat.php?receiver_id=<?= $row['id'] ?>">
                    <?= htmlspecialchars($row['email']) ?>
                </a>
            </li>
        <?php endwhile; ?>
    </ul>
</body>
</html>
