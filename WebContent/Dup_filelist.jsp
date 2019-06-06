<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionFactory" %>
<html>
<head>
<title>View Duplicate File List Rejected</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="admin/css/style.css" rel='stylesheet' type='text/css' />
<link href="admin/css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="admin/css/icon-font.min.css" type='text/css' />
<link href="admin/css/animate.css" rel="stylesheet" type="text/css" media="all">
<link href='//fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<script src="admin/js/jquery-1.10.2.min.js"></script>
</head>    
 <body class="sticky-header left-side-collapsed"  onload="initMap()">
    <section>
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
		  <TABLE class="table table-bordered">
            <TR class="danger">
               <TH>User Name</TH>
               <TH>File Name</TH>
               <TH>Tag</TH>
           </TR>
		<% 
        	Connection connection =ConnectionFactory.getInstance().getConnection();
            Statement statement = connection.createStatement();
          
            ResultSet resultset =statement.executeQuery("select Username,Filename,Tag from dupfiles") ; 
			while(resultset.next())
            {
        %>
           <TR>
               <TD> <%= resultset.getString(1) %></TD>
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>
           </TR>
       <% 
           } 
       %>
       </TABLE>
				</div>
			</div>
   </section>
<script src="admin/js/jquery.nicescroll.js"></script>
<script src="admin/js/scripts.js"></script>
   <script src="admin/js/bootstrap.min.js"></script>
</body>
</html>