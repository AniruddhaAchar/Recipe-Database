
package com.databaseapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Aniruddha 1
 */
public class addRecipe {

    private static Connection connection = null;
    private static Statement statement = null;
    private PreparedStatement preparedStatement;
    private static ResultSet resultSet = null;
    String recipename;
    String user = "root";
    String password = "";
    
    public addRecipe(String rname) throws ClassNotFoundException, SQLException
    {
        this.preparedStatement = null;
        this.recipename=rname;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager
                .getConnection("jdbc:mysql://127.0.0.1:3306/recipe_db",
                        user, password);//connecting and authorizing the database
        statement = connection.createStatement();
    }
    public boolean checkExistance() throws SQLException, ClassNotFoundException
    {
        search s = new search();
        return s.setNameid(recipename);
    }
    public void insertRecipe(String[] steps, String ptime, String ctime) throws ParseException, SQLException
    {
        DateFormat dateFormat = new SimpleDateFormat("HH:mm");
        java.sql.Time prepTime = new Time(dateFormat.parse(ptime).getTime());
        java.sql.Time cookingTime = new Time(dateFormat.parse(ctime).getTime());
        String finalSteps = "";
        for(int i=0;i<steps.length;i++)
        {
            finalSteps+= (i+1)+"."+steps[i]+"<br>";
        }
        System.out.println("insert into recipe(Recipe_name,Recipe_type_id,Cooking_time,Prep_time,Cusine_id,Steps) values ("+"\'"+recipename+"\'"+","+"1"+","+"\'"+cookingTime+"\'"+","+"\'"+prepTime+"\'"+","+"1"+","+"\'"+finalSteps+"\')");
        statement.executeUpdate("insert into recipe(Recipe_name,Recipe_type_id,Cooking_time,Prep_time,Cusine_id,Steps) values ("+"\'"+recipename+"\'"+","+"1"+","+"\'"+cookingTime+"\'"+","+"\'"+prepTime+"\'"+","+"1"+","+"\'"+finalSteps+"\')");
        
    }
    public void insertIngredients(String[] ingredients, String[] quantity) throws SQLException
    {
        for(int i=0; i<ingredients.length;i++)
        {
            String q = "call insertingredient("+"\'"+ingredients[i]+"\'"+","+"\'"+recipename+"\'"+","+"\'"+quantity[i]+"\'"+")";
            statement.execute(q);
        }
    }
    

}
