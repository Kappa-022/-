<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.dao.PlacardDaoImpl"%>
<jsp:useBean id="placard" scope="page" class="commerce.placard">
<jsp:setProperty name="placard" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.wgh.DB.chStr"/>
<jsp:useBean id="conn" scope="page" class="com.wgh.DB.connDB"/>
<jsp:include page="safe.jsp"/>
<%
String title=chStr.chStr(placard.getTitle());
ResultSet rs=conn.executeQuery("select * from tb_bbs where title='"+title+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该公告信息已经添加，请添加新的公告信息！');window.location.href='placard_add.jsp';</script>");
}else{
	int ret=0;
        PlacardDaoImpl ins_placard=new PlacardDaoImpl();
        ret=ins_placard.insert(placard);
	if (ret!=0){
          out.println("<script language='javascript'>alert('公告添加成功！');window.location.href='placardmanage.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('公告添加失败！');window.location.href='placard_add.jsp';</script>");
        }
}
%>