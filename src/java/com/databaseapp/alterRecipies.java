
package com.databaseapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Aniruddha 
 */
public class alterRecipies {

    private String rname;
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

    public alterRecipies(String rname) throws SQLException, ClassNotFoundException {
        this.rname = rname;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager
                .getConnection("jdbc:mysql://127.0.0.1:3306/recipe_db",
                        user, password);
        statement = connection.createStatement();
    }

    public void del() throws SQLException {
        String q = "delete from recipe where Recipe_name = \'" + rname + "\'";
        statement.execute(q);
    }

    public void upd(String update) throws SQLException {
        String q1 = "select idRecipe from recipe where Recipe_name = \'" + rname + "\'";
        System.out.println(q1);
        resultSet = statement.executeQuery(q1);
        resultSet.next();

        int rid = resultSet.getInt("idRecipe");

        String q2 = "update recipe SET Recipe_name =\'" + update + "\' where idRecipe = \'" + rid + "\'";
        System.out.println(q2);
        statement.execute(q2);
    }
}
