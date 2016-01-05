package com.databaseapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class testDB extends SimpleTagSupport {

    private static Connection connection = null;
    private static Statement statement = null;
    private PreparedStatement preparedStatement;
    private static ResultSet resultSet = null;
    recipeDetails details = new recipeDetails();
    public ArrayList<String> names;
    ArrayList<Integer> rid;
    public recipeDetails[] rdetails;
    String user = "root";
    String password = "";

    public testDB() throws SQLException, ClassNotFoundException {
        this.preparedStatement = null;
        this.names = new ArrayList<String>();
        this.rid = new ArrayList<Integer>();
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager
                .getConnection("jdbc:mysql://127.0.0.1:3306/recipe_db",
                        user, password);
        statement = connection.createStatement();
    }

    public void setNameId() throws SQLException {
        
        resultSet = statement.executeQuery("select * from recipe");
        while (resultSet.next()) {

            names.add(resultSet.getString("Recipe_name"));
            rid.add(resultSet.getInt("idRecipe"));
        }
    }

    public void setIngredientsQuantity() throws SQLException {
        rdetails = new recipeDetails[names.size()];
        int j = 0;
        for (int i = 0; i < names.size(); i++) {
            resultSet = statement.executeQuery("call getDetails(" + rid.get(i) + ")");
            rdetails[i] = new recipeDetails();
            while (resultSet.next()) {
                rdetails[i].ingredients.add(resultSet.getString("Ingredients"));
                rdetails[i].quantitys.add(resultSet.getString("Quantity"));
            }
        }
    }
    public void setSteps() throws SQLException
    {
        resultSet = statement.executeQuery("select * from recipe");
        int i=0;
        while(resultSet.next())
        {
            String upsteps = resultSet.getString("Steps");
            String psteps;
            psteps = upsteps.replaceAll("<br>", "<br><br>");
            rdetails[i].setSteps(psteps);
            i++;
        }
    }

    public ArrayList<Integer> getid() {
        return rid;
    }

}
