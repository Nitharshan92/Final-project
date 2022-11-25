<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="project.connection_provider" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        
        <%@include file="common_admin_header.jsp" %>
        <title>Healthy Food</title>
    </head>
    
    <body>
        <%
        
            String email = session.getAttribute("email").toString();
        %>
        <jsp:include page="admin_header.jsp"/>
        
        <section>
            
            <table style="text-align: center;" width="100%">
                
                <thead>
                    <tr>
                        
                        <td style="padding: 10px;">ID</td>
                        <td>NAME</td>
                        <td>E-MAIL</td>
                        <td>SUBJECT</td>
                        <td>BODY</td>
                    </tr>
                </thead>
                <tbody>
                    <%
                    try{
                        
                    Connection con = connection_provider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from message");
                    while(rs.next()){
                    %>
                    <tr>
                        <td style="padding: 5px;"><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=rs.getString(4) %></td>
                        <td><%=rs.getString(5) %></td>
                    </tr>
                    <%
                        }
                        }
                        catch(Exception e){
                        
                            System.out.println(e);
                        }
                    %>
                </tbody>
            </table>
        </section>
        <div class="copyright">
                
            <p>Copyright 2022, Healthy food.</p>
        </div>
    </body>
</html>