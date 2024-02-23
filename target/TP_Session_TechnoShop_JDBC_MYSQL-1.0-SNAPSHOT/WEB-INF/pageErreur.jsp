<%-- 
    Document   : Tp Session TechnoShop
    Created on : 16 déc. 2022
    Author     : yosra houas & Saba Afshar Ghasemloo
--%>
.
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="images/icon.png">
        <title>404 Erreur Page</title>
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,700" rel="stylesheet">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="Css/stylePageErreur.css" />
    </head>
    <body>

        <div id="notfound">
            <div class="notfound">
                <div class="notfound-404"></div>
                <h1>404</h1>
                <h2>${requestScope["message"]}</h2>
                <a href="${requestScope["lien"]}">${requestScope["textelien"]}Back to homepage login</a>
            </div>
        </div>
    </body>
</html>

