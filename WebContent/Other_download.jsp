<!DOCTYPE html>
<%@page import="com.project.mail.Mail"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Prove Identity Before Download File</title>
	<link rel="favicon" href="assets/images/favicon.png">
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen">
	<link rel="stylesheet" type="text/css" href="assets/css/da-slider.css" />
	<link rel="stylesheet" href="assets/css/style.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</head>
<body>
<% 
	if(session.getAttribute("userName")==null)
	{
		 out.print("Please login first");  
         request.getRequestDispatcher("user_signin.jsp").include(request, response);  
	}
	else
	{
%>

	<div class="navbar navbar-inverse">
		<div class="container">
		<h4 align="right"> <font color="red">Welcome <%=session.getAttribute("userName")%></font></h4> 
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a class="navbar-brand" href="Index.jsp">
					<h4>DEDUPLICATION</h4></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right mainNav">
					<li class="active"><a href="user_home.jsp">Home</a></li>
					<li class="active"><a href="file_upload.jsp">Browse File</a></li>
			    	<li class="active"><a href="Own_files.jsp">Own Files</a></li>
			    	<li class="active"><a href="View_files.jsp">View Files</a></li>
			    	<li class="active"><a href="Profile.jsp">Setting</a></li>
					<li class="active"><a href="LogoutServlet">Logout</a></li>
            </ul>            
			</div>
		</div>
		</div>
<div class="container"  align="center">
 
  <h5>Please contact to the owner of a file to get File ID</h5>
  <div class="panel panel-default" style="width: 50%">
    <div class="panel-heading"><h4>Enter File ID Here</h4></div>
    <div class="panel-body">
    <form action="Otherdownload" method="post" autocomplete="off">
        <div class="form-group" align="left">
            <input type="text" name="identity" class="form-control" placeholder="Enter File ID Here" required>
        </div>
        <div align="left">
        <button type="submit" class="btn btn-success">Check</button>
        <button type="reset" class="btn btn-danger">Reset</button>        
        </div>
        </form>
    </div>
  </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
	<footer id="footer">
		<div class="footer2" style="background-color: black;height: 60px; margin-bottom: 00px">
			<div class="container">
				<div class="row">
					<div>
						<div class="panel-body">
							<p align="center">
								Copyright &copy; 2015-16.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</div>
<%
	}
%>
	<script src="assets/js/modernizr-latest.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.cslider.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/jquery-1.3.2.min.js"></script>

</body>
</html>
