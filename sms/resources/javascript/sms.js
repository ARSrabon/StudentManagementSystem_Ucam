/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#student").click(function () {
        $("#student_only").show();
        $("#designation_only").hide();
    });
    $("#faculty").click(function () {
        $("#designation_only").show();
        $("#student_only").hide();
    });

    $('nav li').hover( // menu bar hover animation
            function () {
                $('ul', this).stop().slideDown(200);
            },
            function () {
                $('ul', this).stop().slideUp(200);
            }
    );

});