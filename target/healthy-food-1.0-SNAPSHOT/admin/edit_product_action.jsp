<%@page import="project.connection_provider" %>
<%@page import="java.sql.*" %>
<%

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    String price = request.getParameter("price");
    String active = request.getParameter("active");
    
    try{
    
        Connection con = connection_provider.getCon();
        Statement st = con.createStatement();
        st.executeUpdate("update product set name='"+name+"', category='"+category+"', price='"+price+"', active='"+active+"' where id='"+id+"'");
        if(active.equals("no")){
    
            st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
        }
        response.sendRedirect("products.jsp?msg=done");
    }
    catch(Exception e){
    
        System.out.println(e);
        response.sendRedirect("products.jsp?msg=invalid");
    }
%>