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
                        
                        <h3 class="green">Product updated successfully.</h3><%
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
        
                <section style="width: 100%;" id="orders">
            
            <section>
            
            <table width="100%">
                
                <thead>
                    
                    <tr>
                        
                        <td>ID</td>
                        <td>NAME</td>
                        <td>CATEGORY</td>
                        <td>PRICE</td>
                        <td>STATUS</td>
                        <td>EDIT</td>
                    </tr>
                </thead>
                <tbody>
                    
                    <%
                    
                        try{
                        
                            Connection con = connection_provider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from product");
                            
                            while(rs.next()){ %>
                            
                            <tr>
                                
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><i class="fa-solid fa-rupee-sign"></i>. <%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><a href="edit_product.jsp?id=<%=rs.getString(1)%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
                            </tr>
                        <%}
                        }
                        catch(Exception e){
                        
                            System.out.println(e);
                        }
                    %>
                </tbody>
            </table>
        </section>
        </section>
        
        <div class="copyright">
                
            <p>Copyright 2022, Healthy food.</p>
        </div>
    </body>
</html>