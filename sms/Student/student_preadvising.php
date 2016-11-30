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

$flag = 0;
if ($_SESSION['username'] == '') {
    header("location:../index.php");
}

if (isset($_GET['preadvising'])) {
    $flag = 1;
    $check = $conn->query("SELECT * FROM registration_result where offered_course_id='" . $_GET['course_taken'] . "' AND student_id='" . $_SESSION['student_id'] . "'");
    if (mysqli_num_rows($check) == 0) {
        $flag = 2;
        if ($conn->query("INSERT INTO `registration_result` (`student_id`, `offered_course_id`) VALUES ('" . $_SESSION['student_id'] . "', '" . $_GET['course_taken'] . "')")) {
            $flag = 3;
        }
    }
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
                        <li> <a href="#">Registration<i class='fa fa-angle-down'></i></a>
                            <ul>
                                <li><a href="#">Pre Advising</a></li>
                                <li><a href="#">Section Selection</a></li>
                                <li><a href="#">Final Registration</a></li>
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
        <div class="content_body">

            <div style="background-color: #ffffff;display:block;margin-top: 0px;padding-top: 0px;">
                <h4 style="border-bottom: 2px solid #ff9900;border-top: 2px solid #ff9900"><?= "View Exam Schedule: " . $_SESSION['message']; ?> </h4>
            </div>
            <fieldset>
                <legend>Taken Courses</legend>
                <table border="1" style="border-collapse: collapse;width: 80% ;" sortable>
                    <tr style="background-color: #f3ecd4;">
                        <th>SL</th>
                        <th>Code</th>
                        <th>Title</th>
                        <th>Credits</th>
                        <th>Section</th>
                        <th>Remove Course</th>
                    </tr>
                    <?php
                    $taken = $conn->query("SELECT registration_result.student_id,offered_courses.id, courses.code,courses.title,courses.credit,offered_courses.section,room_timeslots.room_no,room_timeslots.day_1,room_timeslots.day_2,room_timeslots.timeslot FROM offered_courses JOIN semesters ON semesters.id=offered_courses.semester_id JOIN registration_result ON offered_courses.id=registration_result.offered_course_id JOIN courses ON courses.id=offered_courses.course_id JOIN room_timeslots ON room_timeslots.id=offered_courses.room_timeslot_id WHERE semesters.status=2 AND registration_result.student_id='".$_SESSION['student_id']."'");
                    $j=1;    
                    while($done = $taken->fetch_assoc()){
                    ?>
                                                <tr>
                            <td>//<?= $j++ ?></td>
                            <td>//<?= $done['code'] ?></td>
                            <td>//<?= $done['title'] ?></td>
                            <td>//<?= $done['credit'] ?></td>
                            <td>//<?= $done['section'] ?></td>
                        </tr>
                    
                    <?php
                    }
//                    
                    ?>
                </table>
            </fieldset>
            <fieldset>
                <legend>Auto Open Course</legend>
                <div style="width: 100% ;height: 200px;overflow: scroll;">
                    <table border="1" style="background-color: #ffffff; border-collapse: collapse;width: 80% ;" sortable>
                        <tr style="background-color: #f3ecd4;">
                            <th>SL</th>
                            <th>Code</th>
                            <th>Title</th>
                            <th>Credits</th>
                            <th>Room - Time Slot</th>
                            <th>Add/Remove Course</th>
                        </tr>

                        <?php
                        $i = 1;
                        $result = $conn->query("SELECT offered_courses.id, courses.code,courses.title,courses.credit,offered_courses.section,room_timeslots.room_no,room_timeslots.day_1,room_timeslots.day_2,room_timeslots.timeslot FROM offered_courses JOIN semesters ON semesters.id=offered_courses.semester_id JOIN courses ON courses.id=offered_courses.course_id JOIN room_timeslots ON room_timeslots.id=offered_courses.room_timeslot_id WHERE semesters.status=2 ");
                        while ($row = $result->fetch_assoc()) {
                            ?>
                            <tr>
                                <td>
    <?= $i++ ?>
                                </td>
                                <td>
    <?= $row['code'] ?>
                                </td>
                                <td>
    <?= $row['title'] ?>
                                </td>
                                <td>
    <?= $row['credit'] ?>
                                </td>
                                <td>
    <?= $row['day_1'] . " - " . $row['day_2'] . ' [' . $row['timeslot'] . ']' ?>
                                </td>

                                <td>
                                    <a href="student_preadvising.php?preadvising=1&course_taken=<?= $row['id'] ?>">Take this Course</a></td>
                            </tr>
<?php } ?>

                    </table>
                </div>
            </fieldset>

            <span> <?php
                if ($flag == 1) {
                    echo 'its working';
                } else if ($flag == 2) {
                    echo 'no duplicate';
                } else if ($flag == 3) {
                    echo 'DB error';
                } else {
                    echo "failed";
                }
                ?></span>
        </div>
        <script src="../resources/javascript/jquery-1.12.4.js">
        </script>
        <script src="../resources/javascript/myJS.js">
        </script>
        <script src="../resources/javascript/sms.js">
        </script>
    </body>

</html>