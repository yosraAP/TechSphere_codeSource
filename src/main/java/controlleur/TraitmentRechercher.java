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
import javax.servlet.http.HttpSession;
import model.DataManager;
import model.Product;

/**
 *
 * @author afsha
 */
public class TraitmentRechercher extends HttpServlet {

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
        String destination = "";
        String option=request.getParameter("recherche");
        String marque = request.getParameter("marque");
        String prix = request.getParameter("prix");
        String txtRecherche = request.getParameter("txtRecherche");
        ArrayList productRecherche = new ArrayList();

       
     if(option.equals("1")){ //rechercher by NomProduct      
      productRecherche=dataManager.getProducrByNomProduct(txtRecherche);
           
     }else if (option.equals("2")){//rechercher by MarqueProduct  
     productRecherche=dataManager.getProducrByMarqueProduct(marque);
     }else if (option.equals("3")){//rechercher by ByPrice  
    productRecherche=dataManager.getProducrByPrice(Double.parseDouble(prix));
     }

        request.setAttribute("products", productRecherche);
        destination = "/listerProduct.jsp";
        dispatch(destination, request, response);
    }

    protected void dispatch(String destination, HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        if (destination != null) {
            RequestDispatcher rd = request.getRequestDispatcher(destination);
            rd.forward(request, response);
        }
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
        try {
            Class.forName(config.getInitParameter("jdbcDriver"));
        } catch (Exception ex) {
            System.out.println("Initialize connector string");
            ex.printStackTrace();
        }

    }

}
