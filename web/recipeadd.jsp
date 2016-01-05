<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.databaseapp.addRecipe" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <title>Added recipe</title>
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
            <%
                String recipe_name = request.getParameter("recipename");
                String[] Ingredients = request.getParameterValues("ingr[]");
                String[] Quantity = request.getParameterValues("quantity[]");
                String[] Steps = request.getParameterValues("steps[]");
                String ctime = request.getParameter("ctime");
                String ptime = request.getParameter("ptime");
                recipe_name = recipe_name.toLowerCase();
                String fc = recipe_name.substring(0, 1);
                recipe_name = fc.toUpperCase() + recipe_name.substring(1);
            %>
            <%out.println(recipe_name); %>
            <%
                for (int i = 0; i < Ingredients.length; i++) {
                    Ingredients[i] = Ingredients[i].toLowerCase();
                    String ch = Ingredients[i].substring(0, 1);
                    Ingredients[i] = ch.toUpperCase() + Ingredients[i].substring(1);
                    Quantity[i] = Quantity[i].toLowerCase();
                    String qch = Quantity[i].substring(0, 1);
                    Quantity[i] = qch.toUpperCase() + Quantity[i].substring(1);
                }
                for (int i = 0; i < Steps.length; i++) {
                    Steps[i] = Steps[i].toLowerCase();
                    String ch = Steps[i].substring(0, 1);
                    Steps[i] = ch.toUpperCase() + Steps[i].substring(1);
                }
                addRecipe recipe = new addRecipe(recipe_name);
            %>
            <%if (recipe.checkExistance() == true) {%>
            <h1>Recipe already exists. Please change the name or try adding a new recipe.</h1>
            <%}%>
            <%if (recipe.checkExistance() == false) {
                    recipe.insertRecipe(Steps, ptime, ctime);
                    recipe.insertIngredients(Ingredients, Quantity);
                    out.println("<h1>Recipe added successfully</h1>");
                }%>
        </div>
    </body>
</html>
