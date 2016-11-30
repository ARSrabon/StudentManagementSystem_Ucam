<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
// put your code here
session_start();
if ($_SESSION['username'] == '') {
    header("location:../index.php");
}
?>
<html>

    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>

    <body>
        <?= $_SESSION['style']; ?>
        <div class="header_template">
            <table style="width: 100%;">
                <tr>
                    <td><img src="../resources/img/index.gif" alt="university logo"></td>
                    <td>
                        <h2>Student Management System</h2></td>
                    <td><a href="admin_home.php">Hi,
                            <?= $_SESSION['username'] ?></a> </td>
                    <td>
                        <form action="../index.php?logout=1">
                            <input type="submit" value="Log Out!"> </form>
                    </td>
                </tr>
            </table>
        </div>
        <nav>
            <div class="container">
                <ul>
                    <li><a href="admin_home.php">Home</a></li>
                    <li> <a href="admin_offercourse.php">Course<i class='fa fa-angle-down'></i></a>
                        <ul>
                            <li><a href="admin_offercourse.php">Offer Course</a></li>
                            <li><a href="admin_addcourse.php">Add Course</a></li>
                            <li><a href="admin_addcourse.php?addsemester=1">New Semester</a></li>
                        </ul>
                    </li>
                    <li class='sub-menu'> <a href="admin_panel.php">Admin Panel<i class='fa fa-angle-down'></i></a>
                        <ul>
                            <li><a href="admin_panel.php?addstudent=1">Add New Student</a></li>
                            <li><a href="admin_panel.php?addfaculty=1">Add new Faculty</a></li>
                            <li><a href="admin_panel.php?addadmin=1">Create Admin</a></li>
                        </ul>
                    </li>
                    <li class='sub-menu'> <a href="#">Account<i class='fa fa-angle-down'></i></a>
                        <ul>
                            <li><a href="#">Profile</a></li>
                            <li><a href="#">Change Password</a></li>
                        </ul>
                </ul>
            </div>
        </nav>
        </nav>
        <script src="../resources/javascript/jquery-1.12.4.js">
        </script>
        <script src="../resources/javascript/myJS.js">
        </script>
        <script src="../resources/javascript/sms.js">
        </script>

    </body>

</html>