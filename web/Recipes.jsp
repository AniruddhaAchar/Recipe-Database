<%-- 
    Document   : index
    Created on : 18 Sep, 2015, 7:51:18 PM
    Author     : Aniruddha 1
--%>
<%@page import="java.util.ArrayList"%>
<%@page import = "javax.servlet.jsp.JspWriter" %>
<%@page import="com.databaseapp.recipeDetails" %>
<%@page import="com.databaseapp.testDB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ex" uri="WEB-INF/tlds/rnames.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Recipes</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <style>
            div.ig-container{
                display: none;
            }
            body {
                background: #eee !important; 
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
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="page-header">
                        <h1 class="text-center">Recipes</h1>
                    </div>
                    <p class="lead"> Browse recipes from around the world.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">

                    <%
                        testDB test = new testDB();
                        //test.setHeader(response, "Recipe names");
                        test.setNameId();
                        test.setIngredientsQuantity();
                        test.setSteps();
                    %>
                    <div  class="list-group">
                        <%
                            for (int i = 0; i < test.names.size(); i++) {
                        %>

                        <div class="recepie-list-item list-group-item">
                            <h2>  <%=test.names.get(i)%> </h2>
                            <div class="ig-container">
                                <dl class="dl-horizontal">
                                    <%for (int j = 0; j < test.rdetails[i].ingredients.size(); j++) {%>
                                    <dt>
                                    <%=test.rdetails[i].ingredients.get(j)%>
                                    </dt>
                                    <dd>
                                        <%=test.rdetails[i].quantitys.get(j)%>
                                    </dd>
                                    <%}%>
                                </dl>
                                <h3>
                                    Steps:
                                </h3>
                                <p>  <%=test.rdetails[i].getSteps()%> </p>

                            </div>
                            <button class="action-popup">Get details</button>
                            <br>
                            <div class="row">
                                <div class="col-md-6"></div>
                                <div class="col-md-6">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-4">
                                        <form action="delete.jsp" class="text-right">
                                            <input type="hidden" name="rname" value = "<%= test.names.get(i)%>">
                                            <button type="submit" class="btn btn-default"> Delete recipe</button>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <form action="update.jsp" class="text-right">
                                            <input type="hidden" name="rname" value = "<%= test.names.get(i)%>">
                                            <button type="submit" class="btn btn-default"> Update recipe</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
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
