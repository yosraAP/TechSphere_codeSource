/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DataManager;
import model.Product;

/**
 *
 * @author houas
 */
public class TraitmentDonnees extends HttpServlet {
DataManager dataManager;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String destination="";
        String action=request.getParameter("action");
       
        // Afficher list product 
        if (action.equals("afficherProduct") ){
        ArrayList maListe =new ArrayList();
        maListe=dataManager.getproduct();
        System.out.println("nb=" + maListe.size());
        request.setAttribute("products", maListe);
        destination="/listerProduct.jsp";
        }
        
        //Afficher productDetail
        else if (action.equals("afficherProductDetail")){
         Integer id= Integer.parseInt(request.getParameter("id"));
        Product productDetail=new Product();
        productDetail=dataManager.getproductDetailById(id);
        request.setAttribute("productDetail", productDetail);
        destination="/listerProductDetail.jsp";
        }
        
        RequestDispatcher disp =getServletContext().getRequestDispatcher(destination);
        disp.forward(request, response);  
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config); 
        dataManager = new DataManager();
        dataManager.setDbURL(config.getInitParameter("dbURL"));
        dataManager.setDbUserName(config.getInitParameter("dbUserName"));
        dataManager.setDbPassword(config.getInitParameter("dbPassword"));
        try{
           Class.forName(config.getInitParameter("jdbcDriver"));
        }
        catch (Exception ex)
        {
            System.out.println("Initialize connector string");
            ex.printStackTrace();
        }
    }
}
