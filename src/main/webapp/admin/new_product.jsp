<%@page import="project.connection_provider" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        
        <jsp:include page="common_admin_header.jsp"/>
        <title>Healthy Food</title>
    </head>
    
    <body>
        
        <jsp:include page="admin_header.jsp"/>
        
        <section id="mes">
                
                <div class="message">
                
                <div>
                    
                    <%
                    
                        String msg = request.getParameter("msg");
                        if("done".equals(msg)){ %>
                        
                        <h3 class="green">Product added successfully.</h3><%
                        }
                    %>
                    <%
                        if("invalid".equals(msg)){ %>
                        
                        <h3 class="red">Something went wrong.</h3><%
                        }
                    %>
                </div>
            </div>
            </section>
        
                <section style="width: 100%;" id="form-details">
            
            <form action="new_product_action.jsp" method="post">
                
                <span>Creativity is the process that gives life to a new product.</span>
                <%
                
                    int id=1;
                    try{
                        
                        Connection con = connection_provider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select max(id) from product");
                        
                        while(rs.next()){
                    
                            id=rs.getInt(1);
                            id=id+1;
                        }
                        
                    }
                    catch(Exception e){
                    
                        System.out.println(e);
                    }
                %>
                <h2>PRODUCT ID : <% out.print(id); %> </h2>
                <input type="hidden" name="id" value="<% out.print(id); %>">
                <input type="text" name="name" placeholder="Product name" required>
                <select name="category" required>
                    
                    <option value="Breakfast">Breakfast</option>
                    <option value="Lunch">Lunch</option>
                    <option value="Dinner">Dinner</option>
                    <option value="Snacks">Snacks</option>
                    <option value="Desserts">Desserts</option>
                </select>
                <input type="number" name="price" placeholder="Price" required>
                <label>Is the product available?</label>
                <select name="active">
                    
                    <option value="yes" selected>YES</option>
                    <option value="no">NO</option>
                </select>
                <input type="submit" value="ADD PRODUCT">
            </form>
            
        </section>
        
        <div class="copyright">
                
            <p>Copyright 2022, Healthy food.</p>
        </div>
    </body>
</html>