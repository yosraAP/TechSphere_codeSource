/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author afsha
 */
public class User {
   private int idUser;
    private String nom;
    private String prenom;
    private String adresse;
    private String courriel;
    private String MotPasse;
    private String userName;

    public User() {
    }

    public User(int idUser, String nom, String prenom, String adresse, String courriel, String MotPasse, String userName) {
        this.idUser = idUser;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.courriel = courriel;
        this.MotPasse = MotPasse;
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

 
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getCourriel() {
        return courriel;
    }

    public void setCourriel(String courriel) {
        this.courriel = courriel;
    }

    public String getMotPasse() {
        return MotPasse;
    }

    public void setMotPasse(String MotPasse) {
        this.MotPasse = MotPasse;
    }

   
    
    
}
