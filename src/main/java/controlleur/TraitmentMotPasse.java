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
 * @author yosrahouas
 */
public class TraitmentMotPasse extends HttpServlet {

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
        String destination;

        HttpSession session = request.getSession();

        User infoUser = (User) session.getAttribute("infoUser");
        infoUser = new User();
        User user;
        try {

            String userName = request.getParameter("userName");
            //  String prenom=request.getParameter("prenom");
            String motdepass = request.getParameter("pwd");

            user = dataManager.getUsernameEtMotpasse(userName, motdepass);

            if (motdepass.equals(user.getMotPasse()) && userName.equals(user.getUserName())) {

                infoUser.setNom(user.getNom());
                infoUser.setPrenom(user.getPrenom());
                //info.setMotPasse(request.getParameter("pwd"));

                session.setAttribute("infoUser", infoUser);
                destination = "TraitmentPanier?action=CHECKOUT";
                dispatch(destination, request, response);
            } else {
                request.setAttribute("message", "Mot de passe incorrect");
                request.setAttribute("textelien", "Essayer à nouveau");
                request.setAttribute("lien", "login.jsp");
                destination = "/WEB-INF/pageErreur.jsp";
            }
            dispatch(destination, request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Erreur à l'execution \n" + e.getStackTrace());
            request.setAttribute("textelien", "Retour à l'index");
            request.setAttribute("lien", "panier.jsp");
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/WEB-INF/pageErreur.jsp");
            disp.forward(request, response);
        } finally {
        }
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
