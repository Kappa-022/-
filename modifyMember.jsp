<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
if(username!=null && username!=""){
	String sql="select * from tb_member where username='"+username+"'";
	ResultSet rs=conn.executeQuery(sql);
	int id=-1;
	String truename="";
	String PWD="";
	String city="";
	String address="";
	String postcode="";
	String cardNO="";
	String cardType="";
	String tel="";
	String email="";
	if(rs.next()){
		id=rs.getInt(1);
		truename=rs.getString(3);
		PWD=rs.getString(4);
		city=rs.getString(5);
		address=rs.getString(6);
		postcode=rs.getString(7);
		cardNO=rs.getString(8);
		cardType=rs.getString(9);
		tel=rs.getString(12);
		email=rs.getString(13);		
	}
%>
<html>
<head>
<title>Go购电子商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/check.js"></script>
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
        <td width="93" height="33" background="images/shop_12.gif"></td>
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
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="189" valign="top">
		  <form action="modifyMember_deal.jsp" method="post" name="myform">
		  <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="18%" height="30" align="center">用 户 名：</td>
              <td width="82%" class="word_grey"><input name="username" type="text" value="<%=username%>" maxlength="20">
                <span class="word_orange">(用户名不可修改)
                <input name="ID" type="hidden" value="<%=id%>">
                </span></td>
            </tr>
            <tr>
              <td height="2" align="center">真实姓名：</td>
              <td height="28"><input name="truename" type="text" value="<%=truename%>" maxlength="10">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center"> 原 密 码：</td>
              <td height="28"><input name="oldpwd" type="password" size="20" maxlength="20">                  
                <input name="holdpwd" type="hidden" value="<%=PWD%>"></td></tr>
            <tr>
              <td height="28" align="center">新 密&nbsp;码：</td>
              <td height="28"><input name="pwd" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">确认新密码：</td>
              <td height="28"><input name="pwd1" type="password" size="20" maxlength="20">
                <span class="word_orange">*</span> </td>
            </tr>
            <tr>
              <td height="28" align="center">所在城市：</td>
              <td><input name="city" type="text" value="<%=city%>"></td>
            </tr>
            <tr>
              <td height="28" align="center">联系地址：</td>
              <td class="word_grey"><input name="address" type="text" value="<%=address%>"size="50"></td>
            </tr>
            <tr>
              <td height="28" align="center">邮政编码：</td>
              <td class="word_grey"><input name="postcode" type="text" value="<%=postcode%>" size="20"></td>
            </tr>
            <tr>
              <td height="28" align="center">证件号码：</td>
              <td><input name="cardno" type="text" value="<%=cardNO%>">
              <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="28" align="center">证件类别：</td>
              <td><input name="cardtype" type="radio" class="noborder" value="身份证" <%if(cardType.equals("身份证")) out.print("checked");%>>
      身份证&nbsp;
      <input name="cardtype" type="radio" class="noborder" value="军官证" <%if(cardType.equals("军官证")) out.print("checked");%>>
      军官证
      <input name="cardtype" type="radio" class="noborder" value="学生证" <%if(cardType.equals("学生证")) out.print("checked");%>>
      学生证</td>
            </tr>
            <tr>
              <td height="28" align="center">联系电话：</td>
              <td><input name="tel" type="text" value="<%=tel%>"></td>
            </tr>
            <tr>
              <td height="28" align="center" style="padding-left:10px">Email：</td>
              <td class="word_grey"><input name="email" type="text" value="<%=email%>" size="50">
                <span class="word_orange">*</span></td>
            </tr>

            <tr>
              <td height="34">&nbsp;</td>
              <td class="word_grey"><input name="Button" type="button" class="btn_grey" value="确定保存" onClick="check_modi()">
                  <input name="Submit2" type="reset" class="btn_grey" value="重新填写">
                  <input name="Submit22" type="button" class="btn_grey" value="返回" onClick="window.location.href='index.jsp'">
              </td>
            </tr>
          </table>
		  </form>
		  </td>
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
<%}else{
	out.println("<script lanage='javascript'>alert('请先登录，再修改个人信息!');window.location.href='index.jsp';</script>");
}%>
