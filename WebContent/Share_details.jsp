<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.io.File"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionFactory" %>
<html>
<head>
<title>View Uploaded Share Details Here</title>
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
			<div>
		  		<c:set var="categories" value="${sessionScope.categories}" />
				<c:set var="rowsPerPage" value="7" />
				<c:set var="pageNumber" value="${param.pageNumber}"/>
				<c:set var="a">
    			<fmt:formatNumber value="${categories.rowCount/rowsPerPage}" maxFractionDigits="0"/>
				</c:set>
 
				<c:set var="b" value="${categories.rowCount/rowsPerPage}" />
				<c:choose>
    			<c:when test="${a==0}">
        		<c:set var="numberOfPages" value="1" scope="session"/>   
    			</c:when>
			    <c:when test="${b>a}">
        		<c:set var="xxx" value="${b%a}"/>
        		<c:if test="${xxx>0}">
            		<c:set var="numberOfPages" value="${b-xxx+1}" scope="session"/>   
        		</c:if>
    			</c:when>
			    <c:when test="${a>=b}">
        		<c:set var="numberOfPages" value="${a}" scope="session"/>    
    			</c:when>
				</c:choose>
				<c:set var="start" value="${pageNumber*rowsPerPage-rowsPerPage}"/>
				<c:set var="stop" value="${pageNumber*rowsPerPage-1}"/>
				<div style="margin-left: 20px;margin-right: 20px;margin-top: 10px">
   				 <table class="table table-bordered">                    
        			<c:set var="columns" value="0" scope="session"/>
       				 <c:forEach items="${categories.columnNames}" var="name">
            			<c:set var="columns" value="${columns+1}"/>
            			<td bgcolor="silver"><c:out value="${name}"/></td>
        				</c:forEach>
       					 <c:set var="columns" value="${columns-1}"/>
 
        				<c:forEach items="${categories.rowsByIndex}" var="row" begin="${start}" end="${stop}">
          			  <tr>
            	    <c:forEach begin="0" end="${columns}" var="x">
                    <td><c:out value="${row[x]}"/></td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    </div>
    <c:if test="${pageNumber gt 1}">
        <a href="Share_details.jsp?pageNumber=${pageNumber - 1}">Previous</a>
    </c:if>
    <c:forEach begin="1" end="${numberOfPages}" var="i">
        <c:choose>
            <c:when test="${i!=pageNumber}">
                <a href="Share_details.jsp?pageNumber=<c:out value="${i}"/>"><c:out value="${i}"/></a>
            </c:when>
            <c:otherwise>
                <c:out value="${i}"/>
            </c:otherwise>        
        </c:choose>       
    </c:forEach>  
    <c:if test="${pageNumber lt numberOfPages}">
        <a href="Share_details.jsp?pageNumber=${pageNumber + 1}">Next</a>
    </c:if>
			</div>
			</div>
   </section>
<script src="admin/js/jquery.nicescroll.js"></script>
<script src="admin/js/scripts.js"></script>
   <script src="admin/js/bootstrap.min.js"></script>
</body>
</html>