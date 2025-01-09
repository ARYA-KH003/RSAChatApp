<?php
include('DBconnection.php');
header('Content-Type: application/json');

if (!isset($_GET['receiver_id'])) {
    echo json_encode(['error' => 'Receiver ID is required']);
    exit();
}

$receiver_id = intval($_GET['receiver_id']);

$sql = "SELECT public_key FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $receiver_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['public_key' => $row['public_key']]);
} else {
    echo json_encode(['error' => 'Public key not found']);
}

$stmt->close();
$conn->close();
?>
