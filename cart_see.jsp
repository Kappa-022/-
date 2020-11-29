<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
String username="";
username=(String)session.getAttribute("username");
if(username=="" || username==null){
	out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
}else{
	chStr chStr=new chStr();
	connDB conn=new connDB();
	Vector cart=(Vector)session.getAttribute("cart");
	if(cart==null || cart.size()==0){
		response.sendRedirect("cart_null.jsp");
	}else{
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
              <td height="80" background="images/center_cart.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
<table width="100%" height="126"  border="0" cellpadding="0" cellspacing="0">

			    <tr>
                  <td valign="top">
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
<form method="post" action="cart_modify.jsp" name="form1">
<table width="92%" height="48" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
        <td height="27" class="tableBorder_B1">编号</td>
        <td height="27" class="tableBorder_B1">商品编号</td>
        <td class="tableBorder_B1">商品名称</td>
        <td height="27" class="tableBorder_B1">单价</td>
        <td height="27" class="tableBorder_B1">数量</td>
        <td height="27" class="tableBorder_B1">金额</td>
        <td class="tableBorder_B1">退回</td>
      </tr> 
	<%
		float sum=0;
		int ID=-1;
		String goodsname="";
		for(int i=0;i<cart.size();i++){
			goodselement goodsitem=(goodselement)cart.elementAt(i);
			sum=sum+goodsitem.number*goodsitem.nowprice;
			ID=goodsitem.ID;
			if (ID>0){
				ResultSet rs_goods=conn.executeQuery("select * from tb_goods where ID="+ID);
				if (rs_goods.next()){
					goodsname=rs_goods.getString("goodsname");
				}
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="32" height="27"><%=i+1%></td>
        <td width="109" height="27"><%=ID%></td> 
        <td width="199" height="27"><%=goodsname%></td>
        <td width="59" height="27">￥<%=goodsitem.nowprice%></td> 
        <td width="51" height="27">
          <input name="num<%=i%>" size="7" type="text" class="txt_grey" value="<%=goodsitem.number%>" onBlur="check(this.form)"></td> 
        <td width="65" height="27">￥<%=(goodsitem.nowprice*goodsitem.number)%></td> 
        <td width="34"><a href="cart_move.jsp?ID=<%=i%>"><img src="images/del.gif" width="16" height="16"></a></td>
        <script language="javascript">
			<!--
			function check(myform){
				if(isNaN(myform.num<%=i%>.value) || myform.num<%=i%>.value.indexOf('.',0)!=-1){
					alert("请不要输入非法字符");myform.num<%=i%>.focus();return;}
				if(myform.num<%=i%>.value==""){
					alert("请输入修改的数量");myform.num<%=i%>.focus();return;}	
				myform.submit();
			}
			-->
		</script>
	<%
		}

	%> </tr>
      </table>
	  </form>
<table width="100%" height="52" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center" valign="middle">
		<td height="10">&nbsp;		</td>
        <td width="24%" height="10" colspan="-3" align="left">&nbsp;</td>
		</tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">&nbsp;</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1">合计总金额：￥<%=sum%></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"> <a href="index.jsp">继续购物</a> | <a href="cart_checkout.jsp">去收银台结账</a> | <a href="cart_clear.jsp">清空购物车</a> | <a href="#">修改数量</a></td>
        </tr>
</table>
						</td>
                      </tr>
                    </table></td>
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
<%conn.close();}
}%>
