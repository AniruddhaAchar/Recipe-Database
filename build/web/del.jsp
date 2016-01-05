<%-- 
    Document   : del
    Created on : 4 Nov, 2015, 4:59:46 PM
    Author     : Aniruddha 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.databaseapp.alterRecipies" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Deletion Successful</title>
    </head>
    <body>
        <%
            String rname = request.getParameter("rname");
            alterRecipies r = new alterRecipies(rname);
            r.del();
        %>
        <div class="row" style = background:lightgray;border-radius:5px>
                <div class="col-xs-12">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html">Home</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="action"><a href="Recipes.jsp">Browse Recipes <span class="sr-only">(current)</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        <h1>Successfully Deleted</h1>
    </body>
</html>
