<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
ResultSet rs_sale=conn.executeQuery("select top 2 ID,GoodsName,price,nowprice,picture from tb_goods where sale=1 order by INTime desc");
int sale_ID=0;
String s_goodsname="";
float s_price=0;
float s_nowprice=0;
String s_picture="";
ResultSet rs_new=conn.executeQuery("select top 4 ID,GoodsName,nowprice,introduce,picture from tb_goods where newGoods=1 order by INTime desc");
int new_ID=0;
String new_goodsname="";
float new_nowprice=0;
String new_introduce="";
String new_picture="";
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
              <td width="98%" height="80" background="images/shop_18.gif">&nbsp;</td>
              <td width="2%"><img src="images/shop_19.gif" width="10" height="80"></td>
            </tr>
            <tr align="center" valign="top">
              <td height="134" colspan="2"><table width="100%" height="162"  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="49%" height="162" valign="top">
				  <%int s=1;
				  while (rs_sale.next()){
					sale_ID=rs_sale.getInt(1);
					s_goodsname=rs_sale.getString(2);
					s_price=rs_sale.getFloat(3);
					s_nowprice=rs_sale.getFloat(4);
					s_picture=rs_sale.getString(5);
				  	if(s%2==1){
				  %>
				  <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="95" align="center"><img src="images/goods/<%=s_picture%>" width="150" height="88"></td>
                    </tr>
                    <tr>
                      <td height="22" align="center"><a href="goods_detail.jsp?ID=<%=sale_ID%>"><%=s_goodsname%></a></td>
                    </tr>
                    <tr>
                      <td height="20" align="center" style="text-decoration:line-through;color:#FF0000">原价：<%=s_price%> </td>
                    </tr>
                    <tr>
                      <td height="20" align="center">现价：<%=s_nowprice%></td>
                    </tr>
                    <tr>
                      <td height="22" align="center"><input name="see" type="button" class="btn_grey" onClick="window.location.href='goods_detail.jsp?ID=<%=sale_ID%>'" value="详细信息">
						<%if (username!=null && username!=""){%>&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=sale_ID%>'" value="购买">
						 <%}%>
					   </td>
                    </tr>
                  </table>
				  <%}else{%>
				  </td>
                  <td width="2%" align="center" valign="top"><table width="3" height="160"  border="0" cellpadding="0" cellspacing="0" background="images/point.gif">
                    <tr>
                      <td></td>
                    </tr>
                  </table></td>
                  <td width="49%" valign="top">
				    <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="95" align="center"><img src="images/goods/<%=s_picture%>" width="150" height="88"></td>
                      </tr>
                      <tr>
                        <td height="22" align="center"><a href="goods_detail.jsp?ID=<%=sale_ID%>"><%=s_goodsname%></a></td>
                      </tr>
                      <tr>
                        <td height="20" align="center" style="text-decoration:line-through;color:#FF0000">原价：<%=s_price%> </td>
                      </tr>
                      <tr>
                        <td height="20" align="center">现价：<%=s_nowprice%></td>
                      </tr>
                      <tr>
                        <td height="22" align="center"><input name="see" type="button" class="btn_grey" onClick="window.location.href='goods_detail.jsp?ID=<%=sale_ID%>'" value="详细信息">
						<%if (username!=null && username!=""){%>&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=sale_ID%>'" value="购买">
						 <%}%>
						 </td>
                      </tr>
                    </table>
				    <%}
				  s++;
				  }%>				  </td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="42" align="right" background="images/shop_24.gif"><a href="sale.jsp"><img src="images/MORE.GIF" width="50" height="20" border="0"></a><a href="sale.jsp"><br>
                  <br>
              </a></td>
              <td height="42" background="images/shop_25.gif">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" height="76"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="361" background="images/shop_28.gif">&nbsp;</td>
                <td width="46" height="35" background="images/shop_29.gif">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2">
				<%	while (rs_new.next()){
					new_ID=rs_new.getInt(1);
					new_goodsname=rs_new.getString(2);
					new_nowprice=rs_new.getFloat(3);
					new_introduce=rs_new.getString(4);
					new_picture=rs_new.getString(5);
                                        if(new_introduce.length()>20){
                                          new_introduce=new_introduce.substring(0,20)+"...";
                                        }
					%>
				<table width="100%" height="79"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                  <tr>
                    <td width="33%" height="95" rowspan="4" align="center"><img src="images/goods/<%=new_picture%>" width="99" height="61"></td>
                    <td width="67%"><%=new_goodsname%></td>
                    </tr>
                  <tr>
                    <td>单价：<%=new_nowprice%>(元) </td>
                  </tr>
                  <tr>
                    <td><%=new_introduce%></td>
                  </tr>
                  <tr>
                    <td>
                      <input name="see" type="button" class="btn_grey" onClick="window.location.href='goods_detail.jsp?ID=<%=new_ID%>'" value="查看详细信息">
						<%if (username!=null && username!=""){%>&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=new_ID%>'" value="购买">
						 <%}%></td>
                  </tr>
                </table>
				<%}%>	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="98%" align="right"><a href="NewGoods.jsp"><img src="images/MORE.GIF" width="50" height="20" border="0"></a></td>
                    <td width="2%">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          <td width="31%" valign="top"><jsp:include page="right.jsp"/></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="790"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><jsp:include page="copyright.jsp"/></td>
  </tr>
</table>
</td>
</tr>
</table>
</body>
</html>
<%conn.close();%>
