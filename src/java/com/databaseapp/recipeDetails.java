package com.databaseapp;


import java.util.ArrayList;

/*
 
 * @author Aniruddha 
 */
public class recipeDetails {

    String steps;
    public ArrayList<String> ingredients= new ArrayList<>();
    public ArrayList<String> quantitys = new ArrayList<>();

    public recipeDetails() {
        ingredients = new ArrayList<>();
        quantitys = new ArrayList<>();
        steps = null;
    }

    public String getSteps() {
        return steps;
    }

    public void setSteps(String steps) {
        this.steps = steps;
    }
    public void addIngredients(String ingredient)
    {
        ingredients.add(ingredient);
    }
    public void addQuantity(String quantity)
    {
        quantitys.add(quantity);
    }
    public ArrayList<String> getIngredients() {
        return ingredients;
    }

    public ArrayList<String> getQuantity() {
        return quantitys;
    }

}
