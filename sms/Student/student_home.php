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
$result = $conn->query("Select * FROM semesters where status=1 OR status=2");
if (mysqli_num_rows($result) > 0) {
    $sem = mysqli_fetch_all($result, MYSQLI_ASSOC);
//    echo json_encode($sem);
}
$_SESSION['registration'] = array();
$index =0;
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
                        <td><a href=<?= "student_home.php" ?>>Hi,
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
                        <li><a href="student_home.php">Home</a></li>
                        <li> <a href="student_preadvising.php">Registration<i class='fa fa-angle-down'></i></a>
                            <ul>
                                <li><a href="student_preadvising.php">Pre Advising</a></li>
                                <li><a href="#">Section Selection</a></li>
                                <li><a href="#">Final Registration</a></li>
                            </ul>
                        </li>
                        <li class='sub-menu'> <a href="#">My View<i class='fa fa-angle-down'></i></a>
                            <ul>
                                <li><a href="#">Result</a></li>
                                <li><a href="#">View Class Routine</a></li>
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
        <div class="content_body">
            <div>
                <fieldset>
                    <legend>Overview</legend>
                    <table>
                        <tr>
                            <td>Name:</td>
                            <td><?= $_SESSION['user']['first_name'] . "  " . $_SESSION['user']['last_name']; ?></td>
                            <td style="width: 300px"></td>
                            <td>ID:</td>
                            <td><?= $_SESSION['student_id']; ?></td>
                            <td style="width: 300px"></td>
                            <td>CGPA:</td>
                            <td><?= $_SESSION['student']['cgpa']; ?></td>
                        </tr>
                        <tr>
                            <td>Current Semester:</td>
                            <td><?= $sem[0]['name']; ?></td>
                            <td></td>
                            <td>Next Semester:</td>
                            <td><?= $sem[1]['name']; ?></td>
                            <td></td>
                            <td>Credit Completed:</td>
                            <td><?= ""; ?></td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="takecourse" style="display: none;">
                <img src="resources/img/Welcome-Simple-Greeting-Card-Images.jpg" style="width: 25%;">
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