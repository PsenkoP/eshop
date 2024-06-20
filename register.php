<?php
$servername = "localhost";
$username = "psenko3";
$password = "psenko3";
$dbname = "psenko3";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function insertUser($conn, $meno, $heslo, $email) {
    $sql = $conn->prepare("INSERT INTO t_user (username, password, email) VALUES (?, ?, ?)");
    $sql->bind_param("sss", $meno, $heslo, $email);
    if ($sql->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql->error;
    }
    $sql->close();
}

function checkUserExists($conn, $meno) {
    $sql = $conn->prepare("SELECT * FROM t_user WHERE username = ?");
    $sql->bind_param("s", $meno);
    $sql->execute();
    $result = $sql->get_result();
    $sql->close();
    return $result->num_rows > 0;
}

if(isset($_POST['submit'])) {
    $meno = $_POST['username'];
    $heslo = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $email = $_POST['email'];

    if (!checkUserExists($conn, $meno)) {
        insertUser($conn, $meno, $heslo, $email);
    } else {
        $errorMessage = "User with this username already exists.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration form</title>
<style>
    body {
    font-family: 'Roboto', sans-serif; 
    background-color: #eaeaea; 
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.form-container {
    width: 350px; 
    padding: 30px; 
    border: 1px solid #d3d3d3; 
    background-color: #ffffff; 
    border-radius: 8px; 
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1); 
}

input[type="text"],
input[type="password"],
input[type="email"] {
    width: 100%;
    padding: 12px; 
    margin: 15px 0; 
    box-sizing: border-box;
    border: 1px solid #bdbdbd; 
    border-radius: 6px; 
}

input[type="submit"] {
    width: 100%;
    background-color: #007bff; 
    color: white;
    padding: 16px 20px; 
    margin: 10px 0; 
    border: none;
    border-radius: 6px; 
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3; 
}

.error-message {
    color: #d32f2f; 
    margin-top: 15px; 
    text-align: center;
}

.form-container p {
    text-align: center;
    margin-top: 15px; 
}

.form-container a {
    text-decoration: none;
    color: #28a745; 
}

.form-container a:hover {
    text-decoration: underline;
}

.navbar {
    background-color: #333;
    overflow: hidden;
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
}

.navbar a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.navbar a:hover {
    background-color: #ddd;
    color: black;
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
<div class="form-container">
    <h2>Registration Form</h2>
    <form action="register.php" method="post">
        <input type="text" name="username" placeholder="Username" required autofocus><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="submit" name="submit" value="Register">
    </form>
    <div class="error-message"><?php if(isset($errorMessage)) { echo $errorMessage; } ?></div>
    <p>