<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
// put your code here
session_start();
require '../db-config.php';
if ($_SESSION['username'] == '') {
    header("location:../index.php");
}
?>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
    </head>

    <body>
        <style type="text/css">
            @import url("../resources/css/importsOnly.css");
        </style>
        <div>
            <div class="header_template">
                <table style="width: 100%;">
                    <tr>
                        <td><img src="../resources/img/index.gif" alt="university logo"></td>
                        <td>
                            <h2>Student Management System</h2> </td>
                        <td><a href=<?= "faculty.php" ?>>Hi,
                                <?= $_SESSION['username'] ?></a> </td>
                        <td>
                            <form action="index.php?logout=1">
                                <input type="submit" value="Log Out!"> </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div>

            <div>
                <nav>
                    <div class="container">
                        <ul>
                            <li><a href="student.php">Home</a></li>
                            <li> <a href="#">Registration<i class='fa fa-angle-down'></i></a>
                                <ul>
                                    <li><a href="student.php?take_course=1" onclick=<?php
                                        if (isset($_GET['take_course'])) {
                                            $js = <<<GT
                                            "$('#takecourse').show();"
GT;
                                            echo $js;
                                        } else {
                                            echo "''";
                                        }
                                        ?>>Take Course</a></li>
                                    <li><a href="student.php?section=1">Select Sections</a></li>
                                    <li><a href="student.php?viewtaken=1">View Taken Course's</a></li>
                                </ul>
                            </li>
                            <li class='sub-menu'> <a href="#">My View<i class='fa fa-angle-down'></i></a>
                                <ul>
                                    <li><a href="#">Result</a></li>
                                    <li><a href="#">Current Course's</a></li>
                                    <li><a href="#">Course Plan</a></li>
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
            </div>

        </div>
        <script src="../resources/javascript/jquery-1.12.4.js">
        </script>
        <script src="../resources/javascript/myJS.js">
        </script>
        <script src="../resources/javascript/sms.js">
        </script>
    </body>

</html>