<?php
include('DBconnection.php');
session_start();
header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    exit(json_encode(['error' => 'User not authenticated']));
}

$receiver_id = isset($_GET['receiver_id']) ? intval($_GET['receiver_id']) : 0;

if ($receiver_id <= 0) {
    exit(json_encode(['error' => 'Invalid receiver ID']));
}

$sql = "SELECT id, sender_id, recipient_id, message, sender_encrypted_message 
        FROM messages 
        WHERE 
            (sender_id = ? AND recipient_id = ?) 
            OR 
            (sender_id = ? AND recipient_id = ?)
        ORDER BY id ASC";

$stmt = $conn->prepare($sql);
$stmt->bind_param("iiii", $_SESSION['user_id'], $receiver_id, $receiver_id, $_SESSION['user_id']);
$stmt->execute();

$messages = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

echo json_encode(['messages' => $messages]);

$stmt->close();
$conn->close();
?>
