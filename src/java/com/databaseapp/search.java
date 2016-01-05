
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
public class search {

    private static Connection connection = null;
    private static Statement statement = null;
    private PreparedStatement preparedStatement;
    private static ResultSet resultSet = null;
    recipeDetails details = new recipeDetails();//new datastructure to hold the recipe content
    public ArrayList<String> names;//array list to hold all the recipe names
    ArrayList<Integer> rid;//aray list to hold all the recipe id
    public recipeDetails[] rdetails;//an array of recipe detail object
    String user = "root";
    String password = "";

    public search() throws SQLException, ClassNotFoundException {
        this.preparedStatement = null;
        this.names = new ArrayList<String>();
        this.rid = new ArrayList<Integer>();
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager
                .getConnection("jdbc:mysql://127.0.0.1:3306/recipe_db",
                        user, password);//connecting and authorizing the database
        statement = connection.createStatement();
    }

    public boolean setNameid(String rname) throws SQLException {
        rname = "\"" + rname + "\"";//adding quotes to the recipe name as it is a varchar type in MySQL
        String query = "select * from recipe where Recipe_name =" + rname;//a query to retrive the recipe names and details where the recipe name is "rname"
        resultSet = statement.executeQuery(query);
        if (resultSet.next()) {
            names.add(resultSet.getString("Recipe_name"));
            rid.add(resultSet.getInt("idRecipe"));
            while (resultSet.next()) {

                names.add(resultSet.getString("Recipe_name"));
                rid.add(resultSet.getInt("idRecipe"));
            }
            return true;//returns true is there is any recipe of the name "rname". Useful for search
        }
        return false;
    }

    public void setIngredientsQuantity() throws SQLException {//Method to set the ingredients and its quantity for each recipe
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

    public void setSteps(int k) throws SQLException {//Method to set steps for the kth recipe in the array of recipe detail
        resultSet = statement.executeQuery("select Steps from recipe where idRecipe = " + rid.get(k));
        while (resultSet.next()) {
            String upsteps = resultSet.getString("Steps");
            String psteps = null;
            psteps = upsteps.replaceAll("<br>", "<br><br>");
            rdetails[k].setSteps(psteps);
        }
    }

    public ArrayList<Integer> getid() {
        return rid;
    }

    public ArrayList<String> searchByIngredient(String iname) throws SQLException {//method to search recipe  by ingredient
        ArrayList<String> rnames = new ArrayList<>();
        resultSet = statement.executeQuery("call recipe_db.getDetails_by_ingredients(\"" + iname + "\")");
        while (resultSet.next()) {
            String rname = resultSet.getString("name");
            rnames.add(rname);
        }
        return rnames;
    }

}
