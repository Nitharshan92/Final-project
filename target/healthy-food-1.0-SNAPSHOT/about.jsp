<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        
        <%@include file="common/styles.jsp" %>
        <title>Healthy Food</title>
    </head>
    
    <body>
        
        <jsp:include page="common/header.jsp"/>
        
        <section id="page-header" class="about-header">
            
            
            <h2>#Who_are_we</h2>
            
            <p>Why you choose us!</p>
            
        </section>
        
        <section id="about-head" class="section-p1">
            
            <img src="img/cook.jpg" alt="">
            <div>
                
                <h2>We are ...</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                    the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                    type and scrambled it to make a type specimen book. It has survived not only five centuries, but
                    also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in
                    the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently
                    with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                
                <abbr title="">It is a long established fact that a reader will be distracted by the readable content
                    of a page when looking at its layout.</abbr>
                
                <br><br>
                
                <marquee bgcolor="#ccc" loop="-1" scrollamount="5" width="100%">Contrary to popular belief, Lorem Ipsum is not simply random text. 
                    It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years 
                    old.</marquee>
            </div>
        </section>
        
        <jsp:include page="common/footer.jsp"/>
        <div class="copyright">
                
            <p>Copyright 2022, Healthy food.</p>
        </div>
    </body>
</html>