<%-- 
    Document   : Tp Session TechnoShop
    Created on : 16 déc. 2022
    Author     : yosra houas & Saba Afshar Ghasemloo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Techno-Shop</title>
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

        <!-- Carousel -->
        <div class="container">
            <div id="produit" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#produit" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#produit" data-bs-slide-to="1" aria-label="Slide 2"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/img01.jpg" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="images/img02.jpg" class="d-block w-100">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- EndCarousel -->
        <div class="container">
            <h1 class="titre1 text-center mt-3"> <span>P</span>ro<span>d</span>uct<span>s</span> </h1>
            <!--<!-- Filtre -->
            <form  action="TraitmentRechercher" method="POST">
                <div class="accordion-item" id="accordionExample">
                    <div class="container-fluid">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <fmt:message key="btnChoix"/>
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p class="text-end"><select name="recherche" class="select-form bg-white">
                                        <option  value="1"><fmt:message key="produit.nom"/></option>
                                        <option  value="2"><fmt:message key="produit.marque"/></option>
                                        <option value="3"><fmt:message key="produit.prix"/></option>
                                    </select></p>

                                <p class="mx-3 p-2"><fmt:message key="produit.nom"/><input class="w-25" type="text" name="txtRecherche" value="" /></p>
                                <p class="mx-3 p-2"><fmt:message key="produit.marque"/><br>
                                    <input class="p-2 mx-3" type="radio" name="marque" value="HP"/>HP
                                    <input class="p-2 mx-3" type="radio" name="marque" value="ESPON"/>ESPON
                                    <input class="p-2 mx-3" type="radio" name="marque" value="INSIGNIA"/>INSIGNIA<br>
                                    <input class="p-2 mx-3" type="radio" name="marque" value="Hamilton Beach"/>Hamilton Beach
                                    <input class="p-2 mx-3" type="radio" name="marque" value="APPLE"/>APPLE
                                    <input class="p-2 mx-3" type="radio" name="marque" value="ASUS"/>ASUS</p>    
                                <p class="mx-3 p-2"><fmt:message key="produit.prix"/><br>
                                    <input class="p-2 mx-3" type="radio" name="prix" value="100"/>100
                                    <input class="p-2 mx-3" type="radio" name="prix" value="500"/>500
                                    <input class="p-2 mx-3" type="radio" name="prix" value="1000"/>1000
                                    <input class="p-2 mx-3" type="radio" name="prix" value="1500"/>1500
                                </p>
                                <input class="btn_panier" type="submit" value="Recherche" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--<!-- Filtre -->
            <div class="justify-content-center align-content-center">
                <c:forEach var="Listproduct" items="${products}" >
                    <div class="product">
                        <p class="text-center"><img src="./images/${Listproduct.image}" class="img-fluid imgages w-75" ></p>
                        <p class="text-center p-1"><a class="text-decoration-none text-primary" href="TraitmentDonnees?action=afficherProductDetail&id=${Listproduct.idProduct}" >${Listproduct.nomProduct}</a></p>
                        <p class="text-center p-1 text-dark"><fmt:message key="produit.marque"/> ${Listproduct.marqueProduct}</p>
                        <p class="text-center p-1 text-secondary"><fmt:message key="produit.prix"/>${Listproduct.prix} $</p>
                    </div>
                </c:forEach>
            </div>
            <br class="mt-5">   
            <!-- footer -->
            <div class="container-fluid mt-3 p-3">
                <footer class=" footer text-center text-light mb-lg-0 mb-md-0">
                    <p class="fw-lighter">@Techno-Shop</p>
                </footer>
            </div>
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
