<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%
Vector cart=(Vector)session.getAttribute("cart");
try{
	int id=Integer.parseInt(request.getParameter("ID"));
	cart.removeElementAt(id);
	session.setAttribute("cart",cart);
	response.sendRedirect("cart_see.jsp");  
	}catch(Exception e){
}
%>
