/*Name: login.js
 *Desc: This file handle validation for the login form to ensure proper input is being entered
 *Author: Nabeel Khan
 *Date Created: 12-16-19
 *Date Last Modified: 12-16-19 By: Nabeel Khan
 */

//Listener for submit

function validateLogin(e) {
	e.preventDefault();
	
	//Get values from event
	var userEmail = e.target[0].value;
	var userPassword = e.target[1].value;

	// Simple regex to check basic email and password syntax
	var emailCheck = /^\w{1,64}@\w+[.][A-Za-z]{2,}/;
	var passwordCheck = /[\w#!@$%^&*)(}{:">?;'.\/\\]+/;

	if (!emailCheck.test(userEmail) || !passwordCheck.test(userPassword)) {
		alert("Error: Invalid email address or password");
	} else {
			document.getElementById("loginForm").submit();
	}

}