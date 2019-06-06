<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionFactory" %>
<html>
<head>
<title>Admin Profile</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="admin/css/style.css" rel='stylesheet' type='text/css' />
<link href="admin/css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="admin/css/icon-font.min.css" type='text/css' />
<link href="admin/css/animate.css" rel="stylesheet" type="text/css" media="all">
<link href='//fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<script src="admin/js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?sensor=false">
    </script>
</head>    
 <body class="sticky-header left-side-collapsed"  onload="initMap()">
		<div class="left-side sticky-left-side">
			<div class="logo">
				<h1><a href="admin_home.jsp">Admin<span>Panel</span></a></h1>
			</div>
			<div class="logo-icon text-center">
				<a href="admin_home.jsp"><i class="lnr lnr-home"></i> </a>
			</div>
			<div class="left-side-inner">
					<ul class="nav nav-pills nav-stacked custom-nav">
						<li class="menu-list"><a href="#"><i class="lnr lnr-menu"></i> <span>History</span></a>
							<ul class="sub-menu-list">
								<li><a href="User_list.jsp">View Users</a> </li>
								<li><a href="Upload_files.jsp">View Uploaded Files</a> </li>
								<li><a href="share1.jsp">View Share</a> </li>
								<li><a href="Dup_filelist.jsp">View Duplicate Files</a> </li>
								<li><a href="backup1.jsp">View Backup</a> </li>
								<li><a href="admin_signin.jsp">Logout</a> </li>
							</ul>
						</li> 
					</ul>
			</div>
		</div>
		<div class="main-content">
			<div class="header-section">
			<a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
			<div class="menu-right">
				<div class="user-panel-top">  	
					<div class="profile_details">		
						<ul>
							<li class="dropdown profile_details_drop">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<div class="profile_img">	
										 <div class="user-name">
											<p>Welcome<span>Administrator</span></p>
										 </div>
										 <i class="lnr lnr-chevron-down"></i>
										 <i class="lnr lnr-chevron-up"></i>
										<div class="clearfix"></div>	
									</div>	
								</a>
								<ul class="dropdown-menu drp-mnu">
									<li> <a href="Aprofile.jsp"><i class="fa fa-sign-out"></i> Setting</a> </li>
									<li> <a href="admin_signin.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
								</ul>
							</li>
						</ul>
					</div>		
					<div class="clearfix"></div>
				</div>
			  </div>
			</div>
			<div id="page-wrapper">
		 <div style="margin-left: 25%;margin-right: 60px;width: 50%" align="center">
		<% 
        	Connection connection =ConnectionFactory.getInstance().getConnection();
            Statement statement = connection.createStatement();
          
            ResultSet resultset =statement.executeQuery("select * from admin") ; 
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
 <form onsubmit="confirmchange()" action="Achangedetails" method="post" autocomplete="off">  
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
 <form onsubmit="confirmchange()" action="Achangepass" method="post" autocomplete="off">  
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
</div>             
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