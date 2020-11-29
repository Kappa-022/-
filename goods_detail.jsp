<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
int ID=-1;
ID=Integer.parseInt(request.getParameter("ID"));
if(ID>0){
	ResultSet rs=conn.executeQuery("select ID,GoodsName,Introduce,nowprice,picture from tb_goods where ID="+ID);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float nowprice=(float)0.0;
	String picture="";
	if(rs.next()){
		goodsID=rs.getInt(1);
		goodsName=rs.getString(2);
		introduce=rs.getString(3);
		nowprice=rs.getFloat(4);
		picture=rs.getString(5);
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
          <td height="189" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="80" background="images/center01.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
                  <table width="98%" height="79"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    <tr>
                      <td width="37%" height="95" rowspan="4" align="center"><img src="images/goods/<%=picture%>" width="184" height="119"></td>
                      <td width="63%"><%=goodsName%></td>
                    </tr>
                    <tr>
                      <td>单价：<%=nowprice%>(元) </td>
                    </tr>
                    <tr>
                      <td><%=introduce%></td>
                    </tr>
                    <tr>
                      <td><input name="Submit" type="submit" class="btn_grey" onClick="history.back(-1);" value="返回">
&nbsp;					  <%if (username!=null && username!=""){%>&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=goodsID%>'" value="购买">
						 <%}%></td>
                    </tr>
                  </table>
                 </td>
            </tr>
            <tr>
              <td height="38" align="right" background="images/center02.gif"><a href="sale.jsp"><br>
                    <br>
              </a></td>
              </tr>
          </table></td>
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
        <td width="464" valign="bottom" align="center"> CopyRight &copy; 2011  All Rights Reserved</td>
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
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('您的操作有误');window.location.href='index.jsp';");
}%>
