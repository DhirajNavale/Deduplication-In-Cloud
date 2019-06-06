<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Deduplication</title>
	<link rel="favicon" href="assets1/images/favicon.png">
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets1/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets1/css/font-awesome.min.css">
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets1/css/bootstrap-theme.css" media="screen">
	<link rel="stylesheet" type="text/css" href="assets1/css/da-slider.css" />
	<link rel="stylesheet" href="assets1/css/style.css">
	<script src="assets1/js/html5shiv.js"></script>
	<script src="assets1/js/respond.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse" style="background-color: #6699cc;">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a class="navbar-brand" href="Index.jsp">
				<h4>DATA STORAGE MANAGEMENT</h4>
				</a>	
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li><a href="Index.jsp">Home</a></li>
					<li><a href="user_signin.jsp">User</a></li>
					<li><a href="admin_signin.jsp">Admin</a></li>
					

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>  
<div align="center" style="margin-top: 30px" id="login">
<div  style="width: 35%" >
    <div class="panel panel-primary">
		<div class="panel-heading" align="center">Login Form</div>
		<div class="panel-body">
    <form action="Adminsignin" method="post" autocomplete="off">
        <div class="form-group" align="left">    
            <input type="email" class="form-control" id="inputEmail" placeholder="Email ID" name="email" required>
        </div>
        <div class="form-group" align="left">
            <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password" required>
        </div>
        <div class="checkbox" align="left">
            <label><input type="checkbox"> Remember me</label>
        </div>
        <div align="left">
        <button type="submit" class="btn btn-success">Login</button>
         <button type="reset" class="btn btn-primary">Reset</button><br>
        </div>
        <div align="right">
         Forgot Password:        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal1">Click Here</button> 
        </div>
    </form>
</div>
</div>
</div>
</div>
<div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-lg" style="width: 35%">
 <form action="#" method="post" autocomplete="off"> 
      <div class="modal-content">
        <div class="modal-header"  style="background-color: gray;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center">Enter Your Email ID To get Password</h4>
        </div>
        <div class="modal-body">
        <div class="form-group" align="left">
            <input type="email" class="form-control" id="inputEmail" placeholder="Email ID" name="email" required>
        </div>
        <div align="left">
        <button type="submit" class="btn btn-success">Submit</button>
        </div>
        </div>
        </div>
        </form>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br>
	
	<footer id="footer">
			
		<div class="footer2" style="height: 55px">
			<div class="container">
							</div>
				<!-- /row of panels -->
			</div>
	</footer>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="assets1/js/modernizr-latest.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets1/js/jquery.cslider.js"></script>
	<script src="assets1/js/custom.js"></script>
</body>
</html>
