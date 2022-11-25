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
                    <h1 class="green">Delivered Orders</h1>
                </div>
            </div>
        </section>
        
        <section style="width: 100%;" id="orders">
            
            <section>
            
            <table width="100%">
                
                <thead>
                    
                    <tr>
                        
                        <td style="padding: 5px;">Mobile number</td>
                        <td>Product name</td>
                        <td>Quantity</td>
                        <td>Total</td>
                        <td>Address</td>
                        <td>City</td>
                        <td>Province</td>
                        <td>Country</td>
                        <td>Order date</td>
                        <td>Expected delivery time</td>
                        <td>Payment method</td>
                        <td>T-ID</td>
                        <td>Status</td>
                    </tr>
                </thead>
                
                <%
                
                    int sno=0;
                    try{
                    
                        Connection con = connection_provider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.order_date is not NULL and cart.status='Delivered'");
                        while(rs.next()){
                        
                            sno = sno+1;
                %>
                <tbody>
                            
                    <tr>

                        <td style="padding: 5px;"><%=rs.getString(10) %></td>
                        <td><%=rs.getString(17) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=rs.getString(5) %></td>
                        <td><%=rs.getString(6) %></td>
                        <td><%=rs.getString(7) %></td>
                        <td><%=rs.getString(8) %></td>
                        <td><%=rs.getString(9) %></td>
                        <td><%=rs.getString(11) %></td>
                        <td><%=rs.getString(12) %></td>
                        <td><%=rs.getString(13) %></td>
                        <td><%=rs.getString(14) %></td>
                        <td><%=rs.getString(15) %></td>
                    </tr>
                </tbody>
                <%
                
                    }
                    }
                    catch(Exception e){
                    
                        System.out.println(e);
                    }
                %>
            </table>
        </section>
        </section>
        
        <div class="copyright">
                
            <p>Copyright 2022, Healthy food.</p>
        </div>
    </body>
</html>