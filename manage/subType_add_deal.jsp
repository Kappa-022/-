<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.dao.SubtypeDaoImpl"%>
<jsp:useBean id="SubType" scope="page" class="commerce.SubType">
<jsp:setProperty name="SubType" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.wgh.DB.chStr"/>
<jsp:useBean id="conn" scope="page" class="com.wgh.DB.connDB"/>
<jsp:include page="safe.jsp"/>
<%
String typename=chStr.chStr(SubType.gettypename());
ResultSet rs=conn.executeQuery("select * from tb_subType where typename='"+typename+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该小分类信息已经添加，请添加新的小分类信息！');window.location.href='sub_add.jsp';</script>");
}else{
	int ret=0;
        SubtypeDaoImpl ins_subType=new SubtypeDaoImpl();
        ret=ins_subType.insert(SubType);
	if (ret!=0){
          out.println("<script language='javascript'>alert('小分类信息添加成功！');window.location.href='subType.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('小分类信息添加失败！');window.location.href='sub_add.jsp';</script>");
        }
}
%>