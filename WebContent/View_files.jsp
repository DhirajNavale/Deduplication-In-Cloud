<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>View Uploaded Files By Other User Here</title>
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
<% 
String nm=(String)session.getAttribute("userName");
%>
	<div class="navbar navbar-inverse">
		<div class="container">
		<h4 align="right"> <font color="red">Welcome <%=nm%></font></h4> 
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
<div style="margin-left: 20px;margin-right: 20px">
		 <TABLE class="table table-bordered">
            <TR class="danger">
               <TH>ID</TH>
               <TH>File Name</TH>
               <TH>User Name</TH>
               <TH>Download</TH>
           </TR>
		<% 
        	Connection connection =ConnectionFactory.getInstance().getConnection();
            Statement statement = connection.createStatement();
          
           ResultSet resultset =statement.executeQuery("select * from file_storage where Username <>'"+nm+"'") ; 
			while(resultset.next())
             {
        %>
           <TR>
               <TD> <%= resultset.getString(1) %></TD>
               <TD> <%= resultset.getString(3) %> </TD>
               <TD> <%= resultset.getString(2) %></TD>
              <%--  <TD> <a href="Other_download.jsp?file=<%=resultset.getString(1) %>"><input type="button" name="Download" value="Download" class="btn btn-info"></a></TD>  --%>
              
               <TD> <a href="OtherUserFileDownloadController?file=<%=resultset.getString(1) %>&userEmail=<%=nm%>"><input type="button" name="Download" value="Download" class="btn btn-info"></a></TD>  
           </TR>
       <% 
           } 
       %>
         </TABLE>
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
