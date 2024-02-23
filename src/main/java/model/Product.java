/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author afsha
 */
public class Product {
    
    private int idProduct;
    private String nomProduct;
    private String marqueProduct;
     private double prix;
    private String image;
    private String description;
    private int quantity;

    public Product() {
    }

    public Product(int idProduct, String nomProduct, String marqueProduct, double prix, String image, String description, int quantity) {
        this.idProduct = idProduct;
        this.nomProduct = nomProduct;
        this.marqueProduct = marqueProduct;
        this.prix = prix;
        this.image = image;
        this.description = description;
        this.quantity = quantity;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNomProduct() {
        return nomProduct;
    }

    public void setNomProduct(String nomProduct) {
        this.nomProduct = nomProduct;
    }

    public String getMarqueProduct() {
        return marqueProduct;
    }

    public void setMarqueProduct(String marqueProduct) {
        this.marqueProduct = marqueProduct;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "idProduct=" + idProduct + ", nomProduct=" + nomProduct + ", marqueProduct=" + marqueProduct + ", prix=" + prix + ", image=" + image + ", description=" + description + ", quantity=" + quantity + '}';
    }

   
    
    
}
