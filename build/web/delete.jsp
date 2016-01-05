
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <%
            String rname = request.getParameter("rname");
        %>
        <title>Delete <%=rname%></title>
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
            <h2>Do you want to delete <%=rname%></h2>
            <div class="col-md-4">
                <form action="del.jsp" method="post">
                    <input type="hidden" name="rname" value = "<%= rname%>">
                    <button type="submit" class="btn btn-warning"> Delete recipe</button>
                </form> 

            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-default" onClick = "location.href = 'Recipes.jsp'">No</button>
            </div>

        </div>
    </body>
</html>
