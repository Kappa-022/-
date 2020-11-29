<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%
connDB conn=new connDB();
if(session.getAttribute("cart")==""){
	out.println("<script language='javascript'>alert('您还没有购物!');window.location.href='index.jsp';</script>");
}
String Username="";
Username=(String)session.getAttribute("username");
if (Username!=""){
try{
ResultSet rs_user=conn.executeQuery("select * from tb_Member where username='"+Username+"'");
if(!rs_user.next()){
	session.invalidate();
	out.println("<script language='javascript'>alert('请先登录后，再进行购物!');window.location.href='index.jsp';</script>");
	return;
}else{
	String Truename=rs_user.getString("Truename");
	String address=rs_user.getString("address");
	String postcode=rs_user.getString("postcode");
	String tel=rs_user.getString("tel");
%>
<script language="javascript">
function check_member(form){
	if(form.truename.value==""){
		alert("请输入您的真实姓名!");form.truename.focus();return;	
	}
	if(form.address.value==""){
		alert("请输入您的联系地址!");form.address.focus();return;	
	}	
	if(form.postcode.value==""){
		alert("请输入您的邮政编码!");form.postcode.focus();return;	
	}	
	if(form.tel.value==""){
		alert("请输入您的联系电话!");form.tel.focus();return;	
	}
	form.submit();
}
</script>
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
			<%if(Username==null || Username==""){%>^_^ 顾客您好！购买商品请先登录 <a href="register.jsp" class="word_green">[新用户注册]</a><%}else{%>^_^ <%=Username%> 您好! Go购电子商城欢迎您!<%}%></marquee></td>
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
              <td height="80" background="images/center_checkout.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center">
<form method="post" action="cart_order.jsp" name="form_checkout">
                    <table width="100%" height="339"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="7%" height="26">&nbsp; </td>
                        <td height="26" colspan="2" class="word_deepgrey">注意：请您不要恶意或非法提交订单以免造成不必要的麻烦！</td>
                        </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">用 户 名：</td>
                        <td width="74%"><input name="username" type="text" id="username" value="<%=Username%>" readonly="yes">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">真实姓名：</td>
                        <td><input name="truename" type="text" id="truename" value="<%=Truename%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">联系地址：</td>
                        <td><input name="address" type="text" id="address" value="<%=address%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">邮政编码：</td>
                        <td><input name="postcode" type="text" id="postcode" value="<%=postcode%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">联系电话：</td>
                        <td><input name="tel" type="text" id="tel" value="<%=tel%>">
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">付款方式：</td>
                        <td><select name="pay" class="textarea">
      <option>银行付款</option>
      <option>邮政付款</option>
      <option>现金支付</option>
    </select>
                          *</td>
                      </tr>
                      <tr>
                        <td height="26" colspan="2" align="center">运送方式：</td>
                        <td><select name="carry" class="textarea">
      <option>普通邮寄</option>
      <option>特快专递</option>
      <option>EMS专递方式</option>
    </select>
                          *</td>
                      </tr>
                      <tr>
                        <td height="101" colspan="2" align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                        <td><textarea name="bz" cols="50" rows="5" class="textarea" id="bz"></textarea></td>
                      </tr>
                      <tr align="center">
                        <td colspan="3"><input name="Button" type="button" class="btn_grey" value="提交" onClick="check_member(form_checkout)">
                           &nbsp;
                           <input name="Submit2" type="button" class="btn_grey" value="返回" onClick="history.back(1);"></td>
                        </tr>
                    </table>
</form>
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
<%}
}catch(Exception e){
out.println(e.toString());
}
}else{
	session.invalidate();
	out.println("<script language='javascript'>alert('请先登录后，再进行购物!');window.location.href='index.jsp';</script>");
}
%>