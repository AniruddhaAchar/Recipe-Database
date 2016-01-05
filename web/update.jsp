<%-- 
    Document   : update
    Created on : 4 Nov, 2015, 5:34:27 PM
    Author     : Aniruddha 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Update</title>
        <%
            String rname = request.getParameter("rname");
        %>
    </head>
    <body>
        <div class="container">
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
            <h2>Update the name of <%=rname%></h2>
            <div class="col-md-4">
                <form class="form-horizontal" action="upd.jsp" method="post">
                <input type="text" class="form-control" placeholder="New recipe name" name="urname">
                <input type="hidden" name="rname" value = "<%= rname%>">
                <button type="submit" class="btn btn-default">Update</button>
            </form>
            </div>
            
        </div>
    </body>
</html>
