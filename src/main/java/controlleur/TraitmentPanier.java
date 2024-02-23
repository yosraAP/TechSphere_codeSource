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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataManager;
import model.Product;

/**
 *
 * @author houas
 */
public class TraitmentPanier extends HttpServlet {

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
        int id;
        int quantity;
        String action;

        action = request.getParameter("action");
        HttpSession session = request.getSession();
        ArrayList<Product> listItems = (ArrayList<Product>) session.getAttribute("listItems");

        if (action.equals("AjouterPanier")) {

            id = Integer.valueOf(request.getParameter("idProduct"));
            quantity = Integer.valueOf(request.getParameter("qty"));
            Product newItem = dataManager.getproductDetailById(id);
            newItem.setQuantity(quantity);

            if (listItems == null) {
                listItems = new ArrayList<Product>();
                session.setAttribute("listItems", listItems);
                listItems.add(newItem);

                //dataManager.insertCommand(1,newItem.getIdProduct(),newItem.getQuantity());
            } else { //cet exemple ne vérifie pas si l'article a dejà été commandé
                boolean match = false;
                //on vérifie si le CD est déjà dans le panier?
                //pour ne pas l'ajouter une autre fois 
                for (int i = 0; i < listItems.size(); i++) {

                    // si on trouve l'item dans le panier
                    if (listItems.get(i).getIdProduct().equals(newItem.getIdProduct())) {
                        //on va modifier la quantité en lui ajoutantant la
                        // nouvelle quantité
                        listItems.get(i).setQuantity(listItems.get(i).getQuantity() + newItem.getQuantity());

                        //on active la variable qui montre qu'on a trouvé l'item
                        //dans le panier
                        match = true;

                        //insert in to  base de donnes
                        // dataManager.insertCommand(1,listItems.get(i).getIdProduct(),listItems.get(i).getQuantity());
                    } //end of if name matches

                } // end of for

                //si match est à false, donc item non déjà dans le panier,
                //on va devoir l'ajouter
                if (!match) {
                    //on ajoute l'item au panier
                    listItems.add(newItem);
                    //dataManager.insertCommand(1,newItem.getIdProduct(),newItem.getQuantity());
                }
            }//end else

            session.setAttribute("listItems", listItems);
            destination = "/panier.jsp";
            dispatch(destination, request, response);
        } // if Ajouter panier
        // si clic sur delete au panier
        else if (action.equals("DELETE")) {

            //on récupère l'indice de l'item à supprimer  
            String del = request.getParameter("delindex");

            //on supprime l'item du panier
            int d = (new Integer(del)).intValue();
            listItems.remove(d);

            session.setAttribute("listItems", listItems);
            if (listItems.size() != 0) {
                destination = "/panier.jsp";
                dispatch(destination, request, response);
            } else {
                destination = "TraitmentDonnees?action=afficherProduct";
                dispatch(destination, request, response);
                //response.sendRedirect(destination);
            }

        } // si clic sur update au panier
        else if (action.equals("Update")) {

            String updateindex = request.getParameter("updateindex");

            //on trouver l'item du panier
            int d = (new Integer(updateindex)).intValue();
            Product product = (Product) listItems.get(d);

            session.setAttribute("updateItem", product);

            destination = "/modifierPanier.jsp";
            dispatch(destination, request, response);

        } else if (action.equals("SaveUpdate")) {

            String updateindex = (String) session.getAttribute("updateindex");

            // String updateindex = request.getParameter("updateindex");
            quantity = Integer.valueOf(request.getParameter("quantity"));
            double prix = Double.valueOf(request.getParameter("prix"));
            double nprix = 0;
            nprix = prix * quantity;
            prix = nprix;

            //on trouver l'item du panier
            int d = (new Integer(updateindex)).intValue();
            Product product = (Product) listItems.get(d);

            // nouvelle quantité
            product.setQuantity((new Integer(quantity)).intValue());
            product.setPrix(new Double(prix).intValue());
            //on replace l'item dans le panier
            listItems.set(d, product);

            session.setAttribute("listItems", listItems);

            destination = "/panier.jsp";
            dispatch(destination, request, response);

        } else if (action.equals("CHECKOUT")) {

            //on va calculer le prix total
            double total = 0;
            for (int i = 0; i < listItems.size(); i++) {
                Product anOrder = (Product) listItems.get(i);
                double price = anOrder.getPrix();
                int qty = anOrder.getQuantity();
                total += (price * qty);
            }

            //pour tax
            total += 0.005;
            String amount = new Float(total).toString();
            int n = amount.indexOf('.');
            amount = amount.substring(0, n + 3);
            request.setAttribute("amount", amount);

            //on redirige la requête vers la page de Checkout
            String url = "/Checkout.jsp";
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
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
