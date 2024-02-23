/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlleur;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataManager;
import model.User;

/**
 *
 * @author afsha
 */
public class TraitmentUser extends HttpServlet {
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
      String action;
        
      action=request.getParameter("action");
      HttpSession session =request.getSession();
      
      User info =(User) session.getAttribute("info");
            
        if (action.equals("save"))//source!=null
        {
            //créer le bean avec les infos envoyées
            info=new User();
            info.setNom(request.getParameter("nom"));
            info.setPrenom(request.getParameter("prenom"));
            info.setCourriel(request.getParameter("courriel"));
            info.setAdresse(request.getParameter("adresse"));
            info.setMotPasse(request.getParameter("motPass"));
             info.setUserName(request.getParameter("userName"));

              dataManager.insertUsers(info.getNom(), info.getPrenom(), info.getAdresse(), info.getCourriel(), info.getMotPasse(),info.getUserName());
           
              //créer l'objet de session 
            session.setAttribute("info", info);
            destination="login.jsp";
        }     
        else if (action.equals("update"))
        {
           String userName=request.getParameter("userName");
           String nmotdepass=request.getParameter("nPwd");
           dataManager.ChangerMotPass(userName, nmotdepass);
            destination="/login.jsp";
        }  
        
            dispatch(destination,request, response);
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
        try{
           Class.forName(config.getInitParameter("jdbcDriver"));
        }
        catch (Exception ex)
        {
            System.out.println("Initialize connector string");
            ex.printStackTrace();
        }    }

    
}
