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
                        
                        <h1 class="green">Product added successfully.</h1><%
                        }
                    %>
                    <%
                        if("invalid".equals(msg)){ %>
                        
                        <h1 class="red">Something went wrong.</h1><%
                        }
                    %>
                </div>
            </div>
        </section>
        
        <section id="form-details">
            
            <form action="edit_product_action.jsp" method="post">
                <button><a href="products.jsp"><i class="fa-solid fa-chevron-left"></i> BACK TO PRODUCTS</a></button>
                <%
                
                    String id = request.getParameter("id");
                    try{
                    
                        Connection con = connection_provider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from product where id='"+id+"'");
                        
                        while(rs.next()){
                   
                %>
                <input type="hidden" name="id" value="<% out.print(id); %>">
                <input type="text" name="name" placeholder="Product name" value="<%=rs.getString(2) %>" required>
                <select name="category" required>
                    <option value="<%=rs.getString(3) %>"><%=rs.getString(3) %></option>
                    <option value="Breakfast">Breakfast</option>
                    <option value="Lunch">Lunch</option>
                    <option value="Dinner">Dinner</option>
                    <option value="Snacks">Snacks</option>
                    <option value="Desserts">Desserts</option>
                </select>
                <input type="number" name="price" placeholder="Price" value="<%=rs.getString(4) %>" required>
                <label>Is the product available?</label>
                <select name="active">
                    
                    <option value="yes" selected>YES</option>
                    <option value="no">NO</option>
                </select>
                <input type="submit" value="EDIT PRODUCT">
            </form>
            <%
                }
                }
                catch(Exception e){

                    System.out.println(e);
                }
            %>    
            
        </section>
        
        <div class="copyright">
                
            <p>Copyright 2022, Healthy food.</p>
        </div>
    </body>
</html>