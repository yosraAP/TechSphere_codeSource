/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author afsha
 */
public class Command {
    private Integer idCommand;
    private Integer iduser;
    private Integer idProduct;
    private Integer nombreItem;

    public Command() {
    }

    public Command(Integer idCommand, Integer iduser, Integer idProduct, Integer nombreItem) {
        this.idCommand = idCommand;
        this.iduser = iduser;
        this.idProduct = idProduct;
        this.nombreItem = nombreItem;
    }

    public Integer getIdCommand() {
        return idCommand;
    }

    public void setIdCommand(Integer idCommand) {
        this.idCommand = idCommand;
    }

    public Integer getIduser() {
        return iduser;
    }

    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public Integer getNombreItem() {
        return nombreItem;
    }

    public void setNombreItem(Integer nombreItem) {
        this.nombreItem = nombreItem;
    }
    
    
    
    
}
