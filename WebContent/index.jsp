<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/login.js" type="text/javascript"></script>


<link href="./css/style.css" rel="stylesheet">

<style>
body {
	background-image: url('./image/qline.jpg');
}

#loginForm{
	background-color: white;
	padding: 15px;
	border-radius: 10px;
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>

<title>Home | Your Next Trip</title>
</head>
<body>
	<%@ include file="header.html"%>
	<div class="container-fluid">
		<div class="row">
			<!-- Carousel Goes here -->

		</div>
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<form id="loginForm" onSubmit="validateLogin(event)">
					<div class="form-group">
						<label for="loginEmail">Email address</label> 
						<input type="email" 
							   class="form-control" 
							   id="loginEmail" 
							   aria-describedby="emailHelp"
							   placeholder="Email">
					</div>
					
					<div class="form-group">
						<label for="loginPassword">Password</label> 
						<input type="password" 
							   class="form-control" 
							   id="loginPassword"
							   placeholder="Password">
					</div>
					
					<button type="submit" class="btn btn-primary">Login</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="footer.html"%>
</body>
</html>