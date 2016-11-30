<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

    <head>
        <meta charset="UTF-8">
        <title>Student Management System</title>
    </head>
    <?PHP
    session_start();
    $flag = 0;
    include './db-config.php';

    if (isset($_GET['logout'])) {
        session_destroy();
        session_start();
    }

    if (isset($_POST["login"])) {
        $user_name = $_POST["login_username"];
        $user_pass = $_POST["login_password"];
        $sql = "Select * from users where username='" . $user_name . "' and password='" . $user_pass . "'";
        $result = $conn->query($sql);
        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_assoc($result);
            $_SESSION["username"] = $row['first_name'];
            $_SESSION["user_id"] = $row['id'];
            $_SESSION['user'] = $row;
            $_SESSION['style'] = "<style type='text/css'>
            @import url('../resources/css/importsOnly.css');
        </style>";

//        echo $row['id'] . "     " . $row['user_name'] . "<br>";
            $sql_authority = "Select * From authorities where user_id='" . $row['id'] . "'";
            $sql_user_type_faculty = "SELECT * FROM faculties where user_id='" . $row['id'] . "'";
            $sql_user_type_student = "SELECT * FROM students where user_id='" . $row['id'] . "'";

            $result_authority = $conn->query($sql_authority);
            $result_student = $conn->query($sql_user_type_student);
            $result_faculty = $conn->query($sql_user_type_faculty);

            $_SESSION['message'] = '';
//        echo $sql;
            if (mysqli_num_rows($result_authority) == 1) {
                # code...
                $row_auth = mysqli_fetch_assoc($result_authority);
                $_SESSION['table'] = 'authority';
                header("Location:./admin/admin_home.php");
            } else if (mysqli_num_rows($result_faculty) == 1) {
                $row_faculty = mysqli_fetch_assoc($result_faculty);
                $_SESSION['table'] = 'faculties';
                $_SESSION['faculty_id'] = $row_faculty['id'];

                header("Location:./faculty/faculty_home.php");
            } else if (mysqli_num_rows($result_student) == 1) {
                # code...
                $row_student = mysqli_fetch_assoc($result_student);
                $_SESSION['table'] = 'students';
                $_SESSION['student_id'] = $row_student['id'];
                $_SESSION['student'] = $row_student;
                header("Location:./student/student_home.php");
            }
        }
    }

    if (isset($_POST["sign_up"])) {
        $sql_signup = "INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`, `email`) VALUES ('" . $_POST["first_name"] . "', '" . $_POST["last_name"] . "', '" . $_POST["user_name"] . "', '" . $_POST["signUpPassword"] . "', '" . $_POST["signUpEmail"] . "')";
        if ($conn->query($sql_signup)) {
            $sql_signup = "SELECT * FROM users where first_name='" . $_POST['first_name'] . "' and last_name='" . $_POST['last_name'] . "' and username='" . $_POST['user_name'] . "' and email='" . $_POST['signUpEmail'] . "'";
            $result = $conn->query($sql_signup);
            if ($_POST['profession'] == 'faculty') {
                if (mysqli_num_rows($result) == 1) {
                    $row_faculty = mysqli_fetch_assoc($result);
                    $sql_signup = "INSERT INTO `faculties` (`user_id`, `designation_id`, `dept_id`) VALUES ('" . $row_faculty['id'] . "', '" . $_POST['designation_id'] . "', '" . $_POST['dept_id'] . "')";

                    if ($conn->query($sql_signup)) {
                        $_SESSION['table'] = 'faculties';
                        $_SESSION['faculty_id'] = $row_faculty['id'];
                        header("location:faculty/faculty_home.php");
                    } else {
                        echo $sql_signup + "<br>";
                        echo 'Faculty insert error!!' + $row_faculty['id'] + $_POST['designation_id'] + $_POST['dept_id'];
                    }
                }
            } else if ($_POST['profession'] == 'student') {
                if (mysqli_num_rows($result) == 1) {
                    $row_student = mysqli_fetch_assoc($result);
                    $sql_signup = "INSERT INTO `students` (`user_id`, `dept_id`, `student_id`) VALUES ('" . $row_student['id'] . "', '" . $_POST['dept_id'] . "', '" . $_POST['student_id'] . "')";
                    if ($conn->query($sql_signup)) {
                        $_SESSION['table'] = 'students';
                        $_SESSION['student_id'] = $row_student['id'];
                        $_SESSION['student'] = $row_student;
                        header("Location:./student/student_home.php");
                    } else {
                        echo $sql_signup + "<br>";
                        echo 'Student insert error!!';
                    }
                }
            }
        } else {
            $flag = 1;
        }
    }
    ?>

    <body>
        <style type="text/css">
            @import url("resources/css/importsOnly.css");
        </style>
    <center>
        <div class="banner">
            <h1>Welcome to Student Management System</h1> </div>
        <div>
            <div class="content">
                <div class="tabbed">
                    <input name="tabbed" id="tabbed1" type="radio" checked>
                    <section>
                        <h1>
                            <label for="tabbed1">Log In</label>
                        </h1>
                        <div class="_login">
                            <form method="post">
                                <table>
                                    <tr>
                                        <td> Username </td>
                                        <td> :
                                            <input type="text" name="login_username"> </td>
                                        <td id="username_error"> </td>
                                    </tr>
                                    <tr>
                                        <td> Password </td>
                                        <td> :
                                            <input type="password" name="login_password"> </td>
                                        <td id="password_error"> </td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td style="text-align: right;">
                                            <input type="submit" name="login" value="Log In!"> </td>
                                        <td id="username_error"></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </section>
                    <input name="tabbed" id="tabbed2" type="radio">
                    <section>
                        <h1>
                            <label for="tabbed2">Sign Up</label>
                        </h1>
                        <div class="_signup">
                            <form id="signupForm" method="post" onsubmit="return informationValidation()">
                                <table>
                                    <tr>
                                        <td>First Name</td>
                                        <td> :
                                            <input type="text" id="fname" name="first_name" required> </td>
                                        <td id="fname_error"></td>
                                    </tr>
                                    <tr>
                                        <td>Last Name</td>
                                        <td> :
                                            <input type="text" id="lname" name="last_name" required> </td>
                                        <td id="lname_error"></td>
                                    </tr>
                                    <tr>
                                        <td>User Name</td>
                                        <td> :
                                            <input type="text" id="lname" name="user_name" required> </td>
                                        <td id="uname_error"></td>
                                    </tr>
                                    <tr id="student_only">
                                        <td>Student ID</td>
                                        <td> :
                                            <input type="text" id="lname" name="student_id"> </td>
                                        <td id="student_id_error"></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td> :
                                            <input type="email" id="email" name="signUpEmail" required> </td>
                                        <td id="email_error"></td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td> :
                                            <input type="password" id="password" name="signUpPassword" required> </td>
                                        <td id="password_error"></td>
                                    </tr>
                                    <tr>
                                        <td>Department</td>
                                        <td> :
                                            <?php
                                            $sql = "SELECT * FROM departments where 1";
                                            $result = $conn->query($sql);
                                            if ($result->num_rows > 0) {  // check if anything is returned.
                                                // Output data of each row.
                                                ?>
                                                <select name="dept_id" id="dept" required>
                                                    <option value="-1">Select a Department</option>
                                                    <?php while ($row = $result->fetch_assoc()) {
                                                        ?>
                                                        <option value='<?= $row['id'] ?>'>
                                                            <?= $row['code'] ?>
                                                        </option>
                                                        <?php
                                                    }
                                                }
                                                ?>
                                            </select>
                                        </td>
                                        <td id="dept_error"></td>
                                    </tr>
                                    <tr id="designation_only">
                                        <td>Designation</td>
                                        <td> :
                                            <?php
                                            $sql = "SELECT * FROM designations where 1";
                                            $result = $conn->query($sql);
                                            if ($result->num_rows > 0) {  // check if anything is returned.
                                                // Output data of each row.
                                                ?>
                                                <select name="designation_id" id="designation" required>
                                                    <option value="-1">Select a Designation</option>
                                                    <?php while ($row = $result->fetch_assoc()) {
                                                        ?>
                                                        <option value='<?= $row['id'] ?>'>
                                                            <?= $row['designation'] ?>
                                                        </option>
                                                        <?php
                                                    }
                                                }
                                                ?>
                                            </select>
                                        </td>
                                        <td id="designation_error"></td>
                                    </tr>
                                    <tr>
                                        <td>Profession</td>
                                        <td> :
                                            <input type="radio" id="student" name="profession" value="student" checked>Student
                                            <input type="radio" id="faculty" name="profession" value="faculty">Faculty</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="text-align: right;">
                                            <input type="submit" name="sign_up" value="Sign Up!" style="width:auto;"> </td>
                                    </tr>
                                </table>
                            </form>
                            <div>
                                <?php
                                if ($flag == 1) {
                                    echo "<strong>Sorry.Sign up! Failed.</strong> please try again after a few minutes , or Server currently un-available.";
                                }
                                ?></div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </center>
    <script src="resources/javascript/jquery-1.12.4.js"></script>
    <script src="resources/javascript/myJS.js"></script>
    <script src="resources/javascript/sms.js"></script>
</body>

</html>