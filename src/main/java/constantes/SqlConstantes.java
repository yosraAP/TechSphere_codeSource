/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constantes;

/**
 *
 * @author afsha
 */
public  interface SqlConstantes {
    
    static final String GET_ALL_PRODUCTS="SELECT idProduct,nomProduct,marqueProduct,prix,image,description FROM products";
    static final String GET_PRODUCT_BY_ID="SELECT idProduct,nomProduct,marqueProduct,prix,image,description  FROM products where idproduct=";
    static final String INSERT_COMMAND="insert into Command (idUser,idProduct,nombreItem) values";
    static final String GET_USERNAME_MOTPASS="select idUser,nom,prenom,adresse,courriel,motPass,userName from users where ";
    static final String INSERT_Users="insert into users (nom,prenom,adresse,courriel,motpass,userName) values";
    static final String DELETE_USERS="Delete from  users where iduser=";

}
