<?php
include('DBconnection.php');

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $data = json_decode(file_get_contents('php://input'), true);
    $email = mysqli_real_escape_string($conn, $data['email']);
    $password = mysqli_real_escape_string($conn, $data['password']);
    $public_key = mysqli_real_escape_string($conn, $data['public_key']);

    if (empty($email) || empty($password) || empty($public_key)) {
        echo json_encode(['message' => 'Email, password, and public key are required!']);
        exit();
    }

    $sql = "SELECT id FROM users WHERE email = '$email'";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        echo json_encode(['message' => 'This email is already registered. Please use a different email or log in.']);
        exit();
    }

    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $sql = "INSERT INTO users (email, password, public_key) VALUES ('$email', '$hashed_password', '$public_key')";
    if (mysqli_query($conn, $sql)) {
        echo json_encode(['message' => 'Registration successful!']);
    } else {
        echo json_encode(['message' => 'Error: ' . mysqli_error($conn)]);
    }

    mysqli_close($conn);
}
?>
