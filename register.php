<?php 
    session_start();
    $dbhost = "localhost";
    $dbuser = "agdhruv";
    $dbpass = "haha";
    $dbname = "onlineJudge";
    $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

    if(isset($_SESSION['user']))
    {
        header("Location: submit-code.php");
        exit;
    }

    function usernameExists($unm)
    {
        $query = "SELECT * FROM users WHERE UID='{$unm}'";
        $result = mysqli_query($conn,$query);
        $data = mysqli_fetch_assoc($result);
        if(empty($playerlist)){
            return false;
        }
        return true;
    }

    if(isset($_POST['submit'])){
        if(empty(trim($_POST["name"]))){
            $unsuccessfulRegis = "Incomplete Details";
        }
        else if(empty(trim($_POST["userID"]))){
            $unsuccessfulRegis = "Incomplete Details";
        }
        else if(empty(trim($_POST["userPassword"]))){
            $unsuccessfulRegis = "Incomplete Details";
        }
        else if(usernameExists($_POST["userID"])){
            $unsuccessfulRegis = "Username already exists.";
        }
        else{
            $UID = isset($_POST["userID"])?mysqli_real_escape_string($conn,$_POST["userID"]):"";
            $password = isset($_POST["userPassword"])?mysqli_real_escape_string($conn,$_POST["userPassword"]):"";
            $name = isset($_POST["name"])?mysqli_real_escape_string($conn,$_POST["name"]):"";
            $query = "INSERT into users VALUES ('{$UID}','{$password}','{$name}','0','0.0')";
            mysqli_query($conn,$query);
            $unsuccessfulRegis = "Successfully registered!";
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Register</title>
</head>
<body>
	<form method="POST" action="register.php">
		Name: <input type="text" placeholder="Name" name="name"><br>
		User ID: <input type="text" placeholder="Unique User ID" name="userID"><br>
		Password: <input type="password" name="userPassword"><br>
		<input type="submit" name="submit">
	</form>
	<p><?php echo htmlentities($unsuccessfulRegis); ?></p>
</body>
<?php
	mysqli_close($conn);
?>
</html>