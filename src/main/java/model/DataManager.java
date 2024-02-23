/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import constantes.SqlConstantes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author afsha
 */
public class DataManager {
    private String dbURL = "";
    private String dbUserName = "";
    private String dbPassword = "";

    public DataManager() {
    }

    public String getDbURL() {
        return dbURL;
    }

    public void setDbURL(String dbURL) {
        this.dbURL = dbURL;
    }

    public String getDbUserName() {
        return dbUserName;
    }

    public void setDbUserName(String dbUserName) {
        this.dbUserName = dbUserName;
    }

    public String getDbPassword() {
        return dbPassword;
    }

    public void setDbPassword(String dbPassword) {
        this.dbPassword = dbPassword;
    }
    
    
    /*
     * Open database connection
     */
    public Connection getConnection()
    {
	    Connection conn = null;
           
            String url = getDbURL();
            String userName= getDbUserName();
            String pwd = getDbPassword();
            
            int a = 5;
            
	    try {
                
	       conn = DriverManager.getConnection(url, userName,pwd);
	      }

            catch (SQLException e) {
	      System.out.println("Could not connect to DB");
	      e.printStackTrace();
	      }
	    return conn;
    }

    /**
     * Close open database connection
     */
    public void putConnection(Connection conn)
    {
	    if (conn != null)
	    {
	    	try
	    	{
	    		conn.close();
	    	}
	      catch (SQLException e) {
	      	System.out.println("Enable to close DB connection");
	      	e.printStackTrace(); }
	    }
    }

    /**
    * Get list  Product
    */
    public ArrayList getproduct(){
    
        ArrayList listeProuctDetail=new ArrayList();
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
	 String strQuery = SqlConstantes.GET_ALL_PRODUCTS;
         statement =conn.createStatement();
	 rs=statement.executeQuery(strQuery);
	
         Product product;
		while(rs.next())
		{
                    product=new Product();
                    product.setIdProduct(rs.getInt("idProduct"));
                    product.setNomProduct(rs.getString("nomProduct"));
                    product.setMarqueProduct(rs.getString("marqueProduct"));
                    product.setPrix(Double.parseDouble(rs.getString("prix")));
		    product.setImage(rs.getString("image"));
                    product.setDescription(rs.getString("description"));
                    product.setQuantity(0);
                    listeProuctDetail.add(product);
                                      
                }
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
       	try
       	{
       		rs.close();
       		statement.close();
       	}
         	catch (SQLException e)
                {e.printStackTrace();}
         	putConnection(conn);
       }//end of finally
    
           }//end of if
   return listeProuctDetail;
    }  
    
    
     /**
    * Get list  Product
    */
    public Product getproductDetailById(Integer id){
    
       Product productDetail=new Product();
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
	 String strQuery = SqlConstantes.GET_PRODUCT_BY_ID + id;
         statement =conn.createStatement();
	 rs=statement.executeQuery(strQuery);
	
        
		while(rs.next())
		{
                   
                   productDetail.setIdProduct(rs.getInt("idProduct"));
                    productDetail.setNomProduct(rs.getString("nomProduct"));
                    productDetail.setMarqueProduct(rs.getString("marqueProduct"));
                    productDetail.setPrix( Double.parseDouble(rs.getString("prix")));
                    productDetail.setImage(rs.getString("image"));
                    productDetail.setDescription(rs.getString("description"));
                    productDetail.setQuantity(0);
                    
                    
                   
                                      
                }
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
       	try
       	{
       		rs.close();
       		statement.close();
       	}
         	catch (SQLException e)
                {e.printStackTrace();}
         	putConnection(conn);
       }//end of finally
    
           }//end of if
   return productDetail;
    }  

    public User getUsernameEtMotpasse(String userName,String motpasse){
    
       User user=new User();
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
	 String strQuery = SqlConstantes.GET_USERNAME_MOTPASS + "motPass='"+ motpasse+"'"+ " and userName='" +userName+"'" ;
         statement =conn.createStatement();
	 rs=statement.executeQuery(strQuery);
	
        
		while(rs.next())
		{
                   
                   user.setIdUser(rs.getInt("idUser"));
                    user.setNom(rs.getString("nom"));
                    user.setPrenom(rs.getString("prenom"));
                    user.setAdresse(rs.getString("adresse"));
                    user.setCourriel(rs.getString("courriel"));
                    user.setMotPasse(rs.getString("motpass"));
                    user.setUserName(rs.getString("userName"));
               
            
                }
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
       	try
       	{
       		rs.close();
       		statement.close();
       	}
         	catch (SQLException e)
                {e.printStackTrace();}
         	putConnection(conn);
       }//end of finally
    
           }//end of if
   return user;
    }  
    
    
    /**
     * Insert User
    */
    
 public void insertUsers(String nom,String prenom,String adresse,String courriel,String motpass,String userName){
       
        String strQuery;
                        
         Command command=new Command();
         
             
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
              
        strQuery = SqlConstantes.INSERT_Users +"('"+nom+"','"+prenom+"','"+adresse+"','"+ courriel+"','"+ motpass+"','"+userName+"')";
         statement =conn.createStatement();
	 statement.executeUpdate(strQuery);
        
        
	     
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
             	putConnection(conn);
       }//end of finally
    
           }//end of if

    
        
        }
    

 
 /**
  * ChangerMotPass
  * @param userName
  * @param motpass 
  */
 
  public void ChangerMotPass(String userName,String motpass){
       
        String strQuery;
                        
         Command command=new Command();
         
             
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
              
        strQuery =" UPDATE bd_techno_shop.users  SET motPass = '"+motpass+"' WHERE userName = '" + userName+"'";
         statement =conn.createStatement();
	 statement.executeUpdate(strQuery);
        
        
	     
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
             	putConnection(conn);
       }//end of finally
    
           }//end of if

           
        }
    
 /**
  * DeleteUser
  * @param idUser 
  */
  public void DeleteUser(int idUser){
       
        String strQuery;
                        
         Command command=new Command();
         
             
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
              
        strQuery = SqlConstantes.INSERT_Users + idUser;
         statement =conn.createStatement();
	 statement.executeUpdate(strQuery);
        
        
	     
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
             	putConnection(conn);
       }//end of finally
    
           }//end of if
   
        
        }
  
  /**
   * getProducrByNomProduct
   * @param nomProduct
   * @return 
   */
  
  public ArrayList getProducrByNomProduct(String nomProduct){
    
       ArrayList listProduct=new ArrayList();
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
	 String strQuery = "select idProduct,nomProduct,marqueProduct,prix,image,description from products  where nomProduct like '%"+ nomProduct +"%'";
         statement =conn.createStatement();
	 rs=statement.executeQuery(strQuery);
	        
         Product product;
		while(rs.next())
		{
                    product=new Product();
                    product.setIdProduct(rs.getInt("idProduct"));
                    product.setNomProduct(rs.getString("nomProduct"));
                    product.setMarqueProduct(rs.getString("marqueProduct"));
                    product.setPrix( Double.parseDouble(rs.getString("prix")));
                    product.setImage(rs.getString("image"));
                    product.setDescription(rs.getString("description"));
                    product.setQuantity(0);
                    listProduct.add(product);
            
                }
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
       	try
       	{
       		rs.close();
       		statement.close();
       	}
         	catch (SQLException e)
                {e.printStackTrace();}
         	putConnection(conn);
       }//end of finally
    
           }//end of if
   return listProduct;
    }  
    
  
/**
 * getProducrByMarqueProduct
 * @param marqueProduct
 * @return 
 */  
public ArrayList getProducrByMarqueProduct(String marque){
    
         ArrayList listProduct=new ArrayList();
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
	 String strQuery = "select idProduct,nomProduct,marqueProduct,prix,image,description from products  where marqueProduct like '%"+ marque +"%'";
         statement =conn.createStatement();
	 rs=statement.executeQuery(strQuery);
	        Product product;
		while(rs.next())
		{
                   
                  product=new Product();
                    product.setIdProduct(rs.getInt("idProduct"));
                    product.setNomProduct(rs.getString("nomProduct"));
                    product.setMarqueProduct(rs.getString("marqueProduct"));
                    product.setPrix( Double.parseDouble(rs.getString("prix")));
                    product.setImage(rs.getString("image"));
                    product.setDescription(rs.getString("description"));
                    product.setQuantity(0);
                    listProduct.add(product);
            
                }
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
       	try
       	{
       		rs.close();
       		statement.close();
       	}
         	catch (SQLException e)
                {e.printStackTrace();}
         	putConnection(conn);
       }//end of finally
    
           }//end of if
   return listProduct;
    }  
    
    
/**
 * getProducrByPrice
 * @param price
 * @return 
 */

public ArrayList getProducrByPrice(double price){
    
        ArrayList listProduct=new ArrayList();
	Connection conn = getConnection();
    if (conn != null)
    {
    	ResultSet rs = null;
        Statement statement=null ;
	try
	{
            
	 String strQuery = "select idProduct,nomProduct,marqueProduct,prix,image,description from products  where prix <= "+ price ;
         statement =conn.createStatement();
	 rs=statement.executeQuery(strQuery);
	        
         Product product;
		while(rs.next())
		{
                     product=new Product();
                    product.setIdProduct(rs.getInt("idProduct"));
                    product.setNomProduct(rs.getString("nomProduct"));
                    product.setMarqueProduct(rs.getString("marqueProduct"));
                    product.setPrix( Double.parseDouble(rs.getString("prix")));
                    product.setImage(rs.getString("image"));
                    product.setDescription(rs.getString("description"));
                    product.setQuantity(0);
                    listProduct.add(product);
            
                }
	}//end of try
	catch(SQLException ex){ex.printStackTrace();}
	finally
	{
       	try
       	{
       		rs.close();
       		statement.close();
       	}
         	catch (SQLException e)
                {e.printStackTrace();}
         	putConnection(conn);
       }//end of finally
    
           }//end of if
   return listProduct;
    }  
    
}

