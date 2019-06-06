<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Your Profile Here</title>
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
 <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?sensor=false">
    </script>
</head>
<body>
<%
	String un=(String)session.getAttribute("userName");
	session.setAttribute("Username", un);
%>
<div class="navbar navbar-inverse" style="background-color: #6699cc;">
		<div class="container">
		<h4 align="right"> <font color="black">Welcome <%=session.getAttribute("userName")%></font></h4>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
				<a class="navbar-brand" href="index.jsp">
					DEDUPLICATION</a>
			</div>
			<div class="navbar-collapse collapse">
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
		<div style="margin-left: 25%;margin-right: 60px;width: 50%" align="center">
		<% 
        	Connection connection =ConnectionFactory.getInstance().getConnection();
            Statement statement = connection.createStatement();
          
            ResultSet resultset =statement.executeQuery("select * from user where Email='"+un+"'") ; 
            String name=null,email=null,contact=null,password=null;
			while(resultset.next())
             {
				name=resultset.getString(2);
				email=resultset.getString(3);
				contact=resultset.getString(5);
				password=resultset.getString(4);
             }	
        %>
        <TABLE class="table table-bordered">
            <TR>
               <TH>Name</TH>
               <TD> <%=name %></TD>
            </Tr>   
            <TR >
               <TH>Email</TH>
               <TD> <%= email %> </TD>
            </TR>   
            <TR>
               <Th>Contact</Th>
               <TD> <%= contact %> </TD>
             </tr>  
            <TR>
               <Th>Password</Th>
                <TD> <%=password %> &nbsp;&nbsp;<button type="button" name="Change" class="btn btn-link" data-toggle="modal" data-target="#myModal">Change</button> </TD>   
           	</TR>
         </TABLE>       
<div style="margin-right: 20px" align="right">
	<button type="button" name="Change" class="btn btn-info" data-toggle="modal" data-target="#myModal1">Change Details</button> 
</div>         
         <div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-lg" style="width: 35%">
 <form onsubmit="confirmchange()" action="changedetails" method="post" autocomplete="off">  
      <div class="modal-content">
        <div class="modal-header" style="background-color: gray;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center">Change Account Details Here</h4>
        </div>
        <div class="modal-body">
		<select class="form-control" name="change">
			<option value="Name">User Name</option>
        	<option value="Email">Email</option>
        	<option value="Contact">Contact</option>
		</select><br>
        <div class="form-group" align="left">
            <input type="text" class="form-control" placeholder="Enter New Value" name="value">
        </div>        
        <div align="left">
        <button type="submit" class="btn btn-success">Submit</button>
        <button type="reset" class="btn btn-danger">Reset</button>
        </div>
        </div>
        </div>
        </form>
</div>
</div>              
</div>
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg" style="width: 35%">
 <form onsubmit="confirmchange()" action="Change_password" method="post" autocomplete="off">  
      <div class="modal-content">
        <div class="modal-header"  style="background-color: gray;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center">Change Your Password Here</h4>
        </div>
        <div class="modal-body">
        <div class="form-group" align="left">
            <input type="password" class="form-control" placeholder="Enter Old Password Here" name="oldpassword" required>
        </div>
        <div class="form-group" align="left">
            <input type="password" class="form-control" id="password" placeholder="Enter New Password Here" name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Password must contain at least 6 characters, including UPPER/lowercase and numbers.">
        </div>
        <div class="form-group" align="left">
            <input type="password" class="form-control" id="confirmpassword" placeholder="Confirm New Password" name="confirmpassword" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Password must contain at least 6 characters, including UPPER/lowercase and numbers.">
        </div>        
        <div align="left">
        <button type="submit" class="btn btn-success">Submit</button>
        <button type="reset" class="btn btn-danger">Reset</button>
        </div>
        </div>
        </div>
        </form>
</div>
</div>              
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div>
	<footer id="footer">
		<div class="footer2" style="background-color: black;height: 75px; margin-bottom: 00px">
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
	<script src="assets/js/modernizr-latest.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.cslider.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/jquery-1.3.2.min.js"></script>
<script>
    var password = document.getElementById("password")
  	  , confirm_password = document.getElementById("confirmpassword");

  	function validatePassword(){
  	  if(password.value != confirm_password.value) {
  	    confirm_password.setCustomValidity("Passwords Don't Match");
  	  } else {
  	    confirm_password.setCustomValidity('');
  	  }
  	}
  	password.onchange = validatePassword;
  	confirm_password.onkeyup = validatePassword;
</script>
<script type="text/javascript"> 
function confirmchange() 
{ 
 return confirm("Are you sure you want to change?");   
} 
</script>
</body>
</html>