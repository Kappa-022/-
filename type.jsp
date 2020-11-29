<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
String type="";
type=request.getParameter("Type");
String sql_r="";
if(type.equals("null") || type.equals("")){
	out.println("<script language='javascript'>alert('您的操作有误');window.location.href='index.jsp'</script>");
}else{
	sql_r="select * from V_goods where subID="+type;
	ResultSet rs_r=conn.executeQuery(sql_r);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float nowprice=(float)0.0;
	String subTypename="";
	String superTypename="";
	ResultSet rs_type=conn.executeQuery("select * from V_type where subID="+type);
	if(rs_type.next()){
		superTypename=rs_type.getString(2);
		subTypename=rs_type.getString(3);
	}
%>
<html>
<head>
<title>Go购电子商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<table width="790"  border="0" cellspacing="0" cellpadding="0" align="center">
 <tr>
 <td class="tableBorder">
<jsp:include page="navigation.jsp"/>
<table width="790" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="182" height="182" valign="top">
	<jsp:include page="left.jsp"/>
	</td>
    <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="33" background="images/shop_12.gif"></td>
        <td width="505" height="33" align="right" valign="middle" background="images/shop_12.gif"><table width="100%" height="24"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td align="right" class="word_green">
			<marquee direction="left" scrollamount="1" scrolldelay="1" onMouseOver="this.stop();" onMouseOut="this.start();">
			<%if(username==null || username==""){%>^_^ 顾客您好！购买商品请先登录 <a href="register.jsp" class="word_green">[新用户注册]</a><%}else{%>^_^ <%=username%> 您好! Go购电子商城欢迎您!<%}%></marquee></td>
          </tr>
        </table></td>
        <td width="10" background="images/shop_12.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="93" height="50" background="images/shop_15.gif">&nbsp;</td>
        <td colspan="2" background="images/shop_16.gif">
			<jsp:include page="search.jsp"/>
		</td>
      </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="69%" height="189" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="98%" height="80" background="images/center_type.gif">&nbsp;</td>
              <td width="2%"><img src="images/shop_19.gif" width="10" height="80"></td>
            </tr>
            <tr align="center" valign="top">
              <td height="134" align="center"><table width="90%" height="23"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                    <tr>
                      <td height="23"> 当前选择的类别：[ <%=superTypename%> ]->[ <%=subTypename%> ]</td>
                      </tr>
                  </table>
			  <%
	while(rs_r.next()){
	goodsID=rs_r.getInt("ID");
	goodsName=rs_r.getString("goodsName");
	introduce=rs_r.getString("introduce");
	nowprice=rs_r.getFloat("nowprice");
	if(introduce.length()>10){
	  introduce=introduce.substring(0,10)+"...";
	}
	%>
                  <table width="96%" height="23"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    <tr>
                      <td width="28%" height="23" style="padding-left:20px;"><a href="goods_detail.jsp?ID=<%=goodsID%>"><%=goodsName%></a>
					  </td>
                      <td width="41%">&nbsp;<%=introduce%></td>
                      <td width="21%" align="center"><%=nowprice%>(元)</td>
                      <%if (username!=null && username!=""){%>
					  <td width="10%" align="center">&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=goodsID%>'" value="购买">
						</td>
						 <%}%> 
                    </tr>
                  </table>
				  <%}%>
                 </td>
            </tr>
            <tr>
              <td height="42" align="right" background="images/shop_24.gif"><a href="sale.jsp"><br>
                  <br>
              </a></td>
              <td height="42" background="images/shop_25.gif">&nbsp;</td>
            </tr>
          </table>
            </td>
          <td width="31%" valign="top"><jsp:include page="right.jsp"/></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="790"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="78"  border="0" align="center" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="13" colspan="5"><div align="center">
          <hr width="100%" size="1">
          </div></td>
        </tr>
      <tr>
        <td width="124" height="13">&nbsp;</td>
        <td height="13" colspan="3" align="center">客户服务热线：0372-12345678 传真：0372-12345678</td>
        <td width="141">&nbsp;</td>
      </tr>
      <tr>
        <td height="15" colspan="2">&nbsp;</td>
        <td width="464" valign="bottom" align="center"> CopyRight &copy; 2011 All Rights Reserved</td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td align="center">本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr bgcolor="#cccccc">
        <td height="8" colspan="2"></td>
        <td height="8" align="center"></td>
        <td height="8" colspan="2"></td>
      </tr>
    </table></td>
  </tr>
</table>
</td>
</tr>
</table>
</body>
</html>
<%conn.close();}%>