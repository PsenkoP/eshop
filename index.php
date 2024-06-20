<?php
session_start();
if (isset($_POST['login']) && !empty($_POST['username']) && !empty($_POST['password'])) {
    $servername = "localhost";
    $username = "psenko3";
    $password = "psenko3";
    $dbname = "psenko3";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT password FROM t_user WHERE username = '".$_POST['username']."'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($_POST['password'], $row["password"])) {
            $_SESSION['valid'] = true;
            $_SESSION['timeout'] = time();
            $_SESSION['username'] = $_POST['username'];

            header("Location: welcome.php", true, 301);
            exit();
        } else {
            $error_message = "Wrong password";
        }
    } else {
        $error_message = "Wrong username";
    }
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
<title>Login Form</title>

<style>
   body {
    font-family: 'Roboto', sans-serif;
    background-color: #e9ecef;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.navbar {
    background-color: #343a40;
    overflow: hidden;
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}

.navbar a {
    float: left;
    display: block;
    color: #f8f9fa;
    text-align: center;
    padding: 14px 20px;
    text-decoration: none;
}

.navbar a:hover {
    background-color: #495057;
    color: white;
}

.login-container {
    margin-top: 80px;
    text-align: center;
    width: 100%;
    max-width: 400px;
}

form {
    width: 100%;
    padding: 30px;
    border: 1px solid #ced4da;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 15px;
    margin: 10px 0;
    box-sizing: border-box;
    border: 1px solid #ced4da;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    width: 100%;
    background-color: #007bff;
    color: white;
    padding: 15px;
    margin: 20px 0 10px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.register-link {
    margin-top: 20px;
}

.register-link a {
    text-decoration: none;
    color: #007bff;
    font-weight: 500;
}

.register-link a:hover {
    text-decoration: underline;
    color: #0056b3;
}

.error-message {
    color: #dc3545;
    margin-top: 10px;
    font-weight: 500;
}
</style>
</head>
<body>
<div class="navbar">
<a href="index.php">Home</a>
    <a href="welcome.php">Shop</a>
    <?php if(isset($_SESSION['username'])): ?>
        <a href="logout.php">Logout</a>
    <?php else: ?>
        <a href="register.php">Register</a>
        <a href="index.php">Login</a>
    <?php endif; ?>
</div>

<div class="login-container">
    <h2>Login Form</h2>
    <form action="index.php" method="post">
        <input type="text" name="username" placeholder="Username" required autofocus><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="submit" name="login" value="Login">
    </form>
    <?php if (isset($error_message)): ?>
        <div class="error-message"><?php echo $error_message; ?></div>
    <?php endif; ?>
    <div class="register-link">
        <a href="register.php">Register</a>
    </div>
</div>
</body>
</html>
