<?php

include('DBconnection.php');

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $sql = "SELECT * FROM users WHERE email = '$email'";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $hashed_password = $user['password'];

        if (password_verify($password, $hashed_password)) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['email'] = $user['email'];

            header("Location: chat_selection.php");
            exit();
        } else {
            $error = "Invalid password!";
        }
    } else {
        $error = "No account found with that email!";
    }

    mysqli_close($conn);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AryaTel - Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="AryaTel">
        AryaTel
    </div>
    <div class="login-container">
        <h2>Login to AryaTel</h2>

        <?php if (isset($error)): ?>
            <p style="color:red;"><?php echo $error; ?></p>
        <?php endif; ?>

        <form action="login.php" method="post">
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="login-button">Login</button>
        </form>
        <p class="register-text">Don't have an account? <a href="register.html">Register</a></p>
    </div>
</body>
</html>
