<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.dao.MemberDaoImpl" %>
<jsp:useBean id="member" scope="request" class="commerce.member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
<title>�û�ע��ɹ�!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>  
<%
connDB conn=new connDB();

request.setCharacterEncoding("gb2312");
String username=member.getUsername();
ResultSet rs=conn.executeQuery("select * from tb_Member where username='"+username+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('���û����Ѿ����ڣ�������ע�ᣡ');window.location.href='register.jsp';</script>");
}else{
	int ret=0;
        MemberDaoImpl ins_member=new MemberDaoImpl();
        ret=ins_member.insert(member);
	if (ret!=0){
          out.println("<script language='javascript'>alert('�û�ע��ɹ���');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('�û�ע��ʧ�ܣ�');window.location.href='register.jsp';</script>");
        }
}

%>
</body>
</html>