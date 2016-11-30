function fnameCheck() {
    var fname = document.getElementById("fname");
    var fname_Error = document.getElementById("fname_error");
    if (fname.value.length == 0) {
        fname_Error.innerHTML = "First Name Can't be blank.";
        return false;
    } else {
        fname_Error.innerHTML = "";
        return true;
    }
}

function lnameCheck() {
    var lname = document.getElementById("lname");
    var lname_Error = document.getElementById("lname_error");
    if (lname.value.length == 0) {
        lname_Error.innerHTML = "Last Name can't be blank.";
        return false;
    } else {
        lname_Error.innerHTML = "";
        return true;
    }
}

function passwordCheck() {
    var password = document.getElementById("password");
    var password_Error = document.getElementById("password_error");
    if (password.value.length == 0) {
        password_Error.innerHTML = "Password can not be blank:";
        return false;
    } else if (password.value.length < 8) {
        password_Error.innerHTML = "Minimum password length is 8.";
        return false;
    } else {
        password_Error.innerHTML = "";
        return true;
    }
}

function emailCheck() {
    var email = document.getElementById("email");
    var emailerr = document.getElementById("email_error");
    var filter = /^[A-Za-z0-9]+@[A-Za-z0-9]+.[A-Za-z0-9]+$/;
    if (email.value.length == 0) {
        emailerr.innerHTML = "Email can not be blank.";
        return false;
    } else if (!filter.test(email.value)) {
        emailerr.innerHTML = "Invalid email address.";
        return false;
    } else {
        emailerr.innerHTML = "";
        return true;
    }
}

function districtCheck() {
    var district = document.getElementById("dept");
    var district_error = document.getElementById("dept_error");

    if (district.selectedIndex == 0) {
        district_error.innerHTML = "Select a department.";
        alert("Select a District");
        return false;
    } else if (district.selectedIndex > 0) {
        district_error.innerHTML = "";
        return true;
    }
}

function informationValidation() {
    var flag = 0;
    if (!fnameCheck()) {
        flag = 1;
    }
    if (!lnameCheck()) {
        flag = 1;
    }
    if (!emailCheck()) {
        flag = 1;
    }
    if (!passwordCheck()) {
        flag = 1;
    }
    if (!districtCheck()) {
        alert("Select A Department");
        flag = 1;
    }
    
    console.log("Flag Value =" + flag);
    
    if (flag == 0) {
//        alert("True returned");
        return false;
    } else {
//        alert("false returned");
        return true;
    }
}