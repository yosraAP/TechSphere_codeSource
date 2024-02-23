<%-- 
    Document   : Tp Session TechnoShop
    Created on : 16 déc. 2022
    Author     : yosra houas & Saba Afshar Ghasemloo
--%>
<%@ page session="true" import="java.util.*,model.Product" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Panier</title>
        <link rel="icon" href="images/icon.png">
        <!-- font awesome cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="Css/style.css" />
    </head>
    <body>
        <fmt:setLocale value="${sessionScope.langue}"/>
        <fmt:setBundle basename="ApplicationLangue" />
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container">
                <a class="navbar-brand d-flex justify-content-between align-items-center order-lg-0" href="index.jsp">
                    <img src="images/index.png">
                    <span class="text-uppercase fw-lighter ms-2">Techno-Shop</span>
                </a>
                <div class="order-lg-2">
                    <button type="button" class="btn position-relative">
                        <a class="fa fa-shopping-cart text-dark" href="panier.jsp"></a>
                    </button>
                    <button type="button" class="btn position-relative">
                        <i class="fa fa-heart"></i>
                        <span class="position-absolute top-0 start-100 translate-middle badge bg-primary">2</span>
                    </button> 
                </div>
                <button class="navbar-toggler border-0" type="button" 
                        data-bs-toggle="collapse" data-bs-target="#navMenu">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse order-lg-1" id="navMenu">
                    <ul class="navbar-nav mx-auto text-center">
                        <li class="nav-item border-0"><a class="nav-link px-2 py-2" href="TraitmentDonnees?action=afficherProduct"><fmt:message key="nav.a1"/></a></li>
                        <li class="nav-item px-2 border-0"><a class="nav-link px-2 py-2" href="Checkout.jsp"><fmt:message key="nav.a2"/></a></li>
                        <li class="nav-item px-2 border-0"><a class="nav-link px-2 py-2" href="contact.jsp"><fmt:message key="nav.a3"/></a></li>
                        <li class="nav-item px-2 border-0"><a class="nav-link px-2 py-2" href="login.jsp"><i class="fa fa-user small"></i><fmt:message key="nav.a4"/></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="container ">
            <h1 class="titre1 text-center mt-3 mb-3 p-3"> <span>U</span>pd<span>a</span>te - <span>P</span>an<span>i</span>er </h1>
            <form name="UpdateForm" action="TraitmentPanier" method="POST">
                <div class="d-block justify-content-center align-content-center">
                    <table class="table table-hover">
                        <thead>
                        <td><fmt:message key="chekcout.td1"/></td>
                        <td><fmt:message key="produit.nom"/></td>
                        <td><fmt:message key="produit.prix"/></td>
                        <td><fmt:message key="produit.qte"/></td>
                        <td></td>
                        </thead>
                        <c:set var="itemUpdate" value="${sessionScope.updateItem}" scope="page"/>
                        <c:set var="updateindex" property="" value="${param.updateindex}" scope="session"/>
                        <c:out value="${updateindex}"></c:out>
                            <tr>
                                <td><b>${itemUpdate.idProduct}</b></td>
                            <td><b>${itemUpdate.nomProduct}</b></td>
                            <td><b><input class="border-top-0 border-end-0 border-start-0" type="text" name="prix" value="${itemUpdate.prix}" /></b></td>
                            <td><b><input class="border-top-0 border-end-0 border-start-0" type="text" name="quantity" value="${itemUpdate.quantity}" /></b></td>
                            </td>
                        </tr>
                    </table>
                    <p class="text-end">
                        <input type="Submit" class="btn_panier"  value="<fmt:message key="btnSave"/>">
                        <input type="hidden" name="action" value="SaveUpdate">
                        <a href="panier.jsp" class="btn_panier text-decoration-none" ><fmt:message key="btnCancel"/></a></p>
                </div>
            </form>
        </div>
        <!-- footer -->
        <div class="container-fluid p-3">
            <footer class=" footer text-center text-light mb-lg-0 mb-md-0">
                <p class="fw-lighter">@Techno-Shop</p>
            </footer>
        </div>
        <!-- End Footer -->
        <!-- JQuery -->
        <script src="js/jquery-3.6.1.js"></script>
        <!-- Script -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>

