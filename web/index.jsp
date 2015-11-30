<%-- 
    Document   : newjsp
    Created on : 2 Αυγ 2015, 10:22:13 μμ
    Author     : Fay
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : newjsp
    Created on : 2 Αυγ 2015, 2:19:16 μμ
    Author     : Fay
--%>
<sql:query var="articles" dataSource="jdbc/myDatasource">
    SELECT * FROM articles
</sql:query>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <script src="jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap.min.js"></script>
    <script src="map.js" ></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Εκδηλώσεις Δήμου Ηρακλείου</title>

    <!-- Bootstrap Core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="ol.css" type="text/css">
  <link rel="stylesheet" href="overlay.css">
  
<style>
.marker {
  width: 20px;
  height: 20px;
  border: 1px solid #088;
  border-radius: 10px;
  background-color: #0FF;
  opacity: 0.5;
}
#vienna {
  text-decoration: none;
  color: white;
  font-size: 11pt;
  font-weight: bold;
  text-shadow: black 0.1em 0.1em 0.2em;
}
.popover-content {
  min-width: 180px;
}

</style>
<script src="ol.js"></script>
<script>
   var lonlat=[];
    var ids=[];
</script>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="brand">ΕΚΔΗΛΩΣΕΙΣ ΔΗΜΟΥ ΗΡΑΚΛΕΙΟΥ</div>
    <div class="address-bar">Υποτιτλος</div>

    <!-- Navigation -->

    <div class="container">



    <c:forEach var="row" items="${articles.rowsByIndex}">
       
              <c:if test="${row[4] == 'Published'}">
                  <script>
                      ids.push(<c:out value='${row[0]}' escapeXml="false"/>);
                      lonlat.push("<c:out value='${row[5]}' escapeXml="false"/>");
                     
                      </script>
        <div class="row">
          
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center"><c:out value="${row[1]}" />
                       
                        <strong></strong>
                    </h2>
                    <hr>
                     <div id="<c:out value='${row[0]}'escapeXml="false"/>" style="display: none;" class='marker'>
                                 <c:out value='${row[5]}' escapeXml="false"/>
                                 </div>
                      <script>
                         
                          var id=<c:out value='${row[0]}' escapeXml="false"/>;
            
            
        </script>  
                    <div id="map<c:out value='${row[0]}' escapeXml="false"/>" class="map"></div>
                    
                    <div style="display: none;">
  <!-- Clickable label for Vienna -->
<div id="marker<c:out value='${row[0]}' escapeXml="false"/>"  class="marker"></div>
  
  <!-- Popup -->
  <div id="popup" title="Welcome to ol3"></div>
 
</div>
                    <hr class="visible-xs">
                    <p class="articleText"> <c:out value='${row[2]}' escapeXml="false"/></p>
                       
                        
                    
                    <p>
                    <italic>  <c:out value="${row[3]}"/> </italic>
                    </p>
                </div>
            </div>
                         
           
        </div>
                   
                     </c:if>
    </c:forEach>
         </div>

  
   
    <!-- /.container -->
  

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
  

</body>

</html>
 <script >$(document).ready(mapLoad())</script>