<?php
include('DBconnection.php');
header('Content-Type: application/json');
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['error' => 'User not authenticated']);
    exit();
}

$data = json_decode(file_get_contents('php://input'), true);

$sender_id = $_SESSION['user_id'];
$receiver_id = intval($data['receiver_id']);
$message = $data['message'];
$sender_encrypted_message = $data['sender_encrypted_message'];

if (!$sender_id || !$receiver_id || !$message || !$sender_encrypted_message) {
    echo json_encode(['error' => 'All fields are required']);
    exit();
}

$sql = "INSERT INTO messages (sender_id, recipient_id, message, sender_encrypted_message) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iiss", $sender_id, $receiver_id, $message, $sender_encrypted_message);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
