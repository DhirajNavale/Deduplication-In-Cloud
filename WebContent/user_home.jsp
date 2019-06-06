<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>User Home Page</title>
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
	<div class="navbar navbar-inverse" style="background-color: #6699cc;">
		<div class="container">
		<h4 align="right"> <font color="black">Welcome <%=session.getAttribute("userName")%></font></h4> 
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a style="background-color: #f2f2f2;" href="Index.jsp">
					<h4>DATA DEDUPLICATION</h4></a>
			</div>
			<div class="navbar-collapse collapse" >
				<ul class="nav navbar-nav pull-right mainNav" style="background-color: #b3b3b3;">
					<li class="active"><a href="user_home.jsp">Home</a></li>
					<li class="active"><a href="file_upload.jsp">Upload File</a></li>
			    	<li class="active"><a href="Own_files.jsp">View Files</a></li>
			    	<li class="active"><a href="Profile.jsp">Update Profile</a></li>
					<li class="active"><a href="LogoutServlet">Logout</a></li>
            </ul>        
                     
			</div>
		</div>
		</div>
<div style="margin-top: 20px;">
<img src="assets1/images/cloud4.png" height="850px" width="1940px">
</div>
<div>
	
</div>
<% 
	}
%>
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="assets/js/modernizr-latest.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.cslider.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/jquery-1.3.2.min.js"></script>

</body>
</html>
