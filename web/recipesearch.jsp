<%-- 
    Document   : recipesearch
    Created on : 4 Oct, 2015, 2:37:46 PM
    Author     : Aniruddha 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.databaseapp.recipeDetails" %>
<%@page import="com.databaseapp.search" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Search result</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <style>
            div.ig-container{
                display: none;
            }
            .action-popup{
                width: 150px;
                height: 40px;
                background-color: #337AB7;
                border: solid 1px #337AB7;
                border-radius: 5px;
                font-weight: bold;
                font-size: medium;
                color: whitesmoke;
            }
        </style>
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
            <div class="row">
                <div class="col-xs-12">
                    <%
                        search s = new search();
                        String rname = request.getParameter("rname");
                        rname = rname.toLowerCase();
                        String fc = rname.substring(0, 1);
                        rname = rname.substring(0, 1).toUpperCase() + rname.substring(1);
                        boolean b = s.setNameid(rname);
                    %>
                    <%if (b == false) {%>
                    <div class ="container">
                        <div class="row">
                            <h1 class="text-center">Sorry. No such recipe found on the database</h1>
                        </div>
                    </div>
                    <%}%>
                    <%
                        if (b == true) {
                            s.setIngredientsQuantity();
                            s.setSteps(0);
                    %>
                    <div  class="list-group">
                        <%
                            for (int i = 0; i < s.names.size(); i++) {
                        %>

                        <div class="recepie-list-item list-group-item">
                            <h2>  <%=s.names.get(i)%> </h2>
                            <div class="ig-container">
                                <dl class="dl-horizontal">
                                    <%for (int j = 0; j < s.rdetails[i].ingredients.size(); j++) {%>
                                    <dt>
                                    <%=s.rdetails[i].ingredients.get(j)%>
                                    </dt>
                                    <dd>
                                        <%=s.rdetails[i].quantitys.get(j)%>
                                    </dd>
                                    <%}%>
                                </dl>
                                <h3>
                                    Steps:
                                </h3>
                                <p>  <%=s.rdetails[i].getSteps()%> </p>

                            </div>
                            <button class="action-popup">Get details</button>
                        </div>
                        <%}%>

                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> 
        <script>
            $(function () {
                $('div.ig-container').hide();
                $('button.action-popup').on('click', function (e) {
                    e.preventDefault();
                    var $this = $(this);

                    // $this.parents(".list-group").children('.ig-container').slideUp();
                    var igc = $this.siblings('.ig-container').slideDown();
                });
            });
        </script>




    </body>
</html>
