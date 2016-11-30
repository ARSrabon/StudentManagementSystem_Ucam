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

$semester = $conn->query("Select * FROM semesters where status=1 OR status=2");
$sem = 0;
if (isset($_POST['activate'])) {
    if ($_POST['activeSemester'] != -1) {
        $_SESSION['activesemesterid'] = $_POST['activeSemester'];
        $sem = 1;
    } else {
        echo 'error';
    }
}
?>
<html>

    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>

    <body>
        <style type="text/css">
            @import url("../resources/css/importsOnly.css");
        </style>
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

        <div>

            <div style='<?php
            if ($sem == 1) {
                echo 'display:none;';
            } else {
                echo 'display:inline-block;';
            }
            ?>'>
                <form method="post" action="admin_offercourse.php" >
                    <table>
                        <tr>
                            <td>Select Semester</td>
                            <td>
                                <select name="activeSemester">
                                    <option value="-1">Select Semester</option>
                                    <?php while ($row = $semester->fetch_assoc()) {
                                        ?>
                                        <option value='<?= $row['id'] ?>'>
                                            <?= $row['code'] ?>
                                        </option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </td>
                            <td><input type="submit" name="activate" value="Set Active Semester" style="background-color:  #ffffff;color: #000;"></td>
                        </tr>
                    </table>                   
                </form>
            </div>

            <div class="sect" style='<?php
            if ($sem == 1) {
                echo 'display:inline-block;';
            } else {
                echo 'display:none';
            }
            ?>;width: 100%; height:400px;overflow-y: scroll;'>
                <center>
                    <form method="post" action="admin_offercourse.php">
                        <table border="1" style="border-collapse: collapse;width: 100% ; background-color: #ffffff;" sortable>
                            <tr style="background-color: #f3ecd4;">
                                <th>SL</th>
                                <th>Code</th>
                                <th>Title</th>
                                <th>Credits</th>
                                <th id="special">Semester Code</th>
                                <th>Section</th>
                                <th>Room - Time Slot</th>
                                <th>Add/Remove</th>
                            </tr>
                            <?php
                            $result = $conn->query("SELECT * From courses");
                            $i = 1;
                            while ($row = $result->fetch_assoc()) {
                                ?>
                                <tr>
                                    <td><?= $i++ ?></td>
                                    <td><?= $row['code'] ?></td>
                                    <td><?= $row['title'] ?></td>
                                    <td><?= $row['credit'] ?></td>
                                    <td><?= $_SESSION['activesemesterid'] ?></td>
                                    <td id="special"><input type="text" name="section"></td>
                                    <td><select>
                                            <?php
                                            $times = $conn->query("SELECT * FROM `room_timeslots`");
                                            while ($time = $times->fetch_assoc()) {
                                                ?>
                                                <option><?= $time['room_no'] . ' - [ ' . $time['day_1'] . ' ' . $time['timeslot'] . '] - [' . $time['day_2'] . ' ' . $time['timeslot'] . ']' ?></option>
                                            <?php } ?>
                                        </select></td>
                                    <td>
                                        <input type="submit" name="offercourse" value="Add Section">
                                    </td>

                                </tr>
                            <?php } ?>
                        </table>
                    </form>
                </center>
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