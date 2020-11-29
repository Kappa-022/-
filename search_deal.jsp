<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
String username=(String)session.getAttribute("username");
String type=request.getParameter("type");
String key=chStr.chStr(request.getParameter("key"));
String sql="";
String typename="";
if(type!=null){
	if(!type.equals("0")){
		sql="where superID="+type;
		if(!key.equals("") && !key.equals(null)){
			sql=sql+" and GoodsName like '%"+key+"%'";
		}
		ResultSet rs_type=conn.executeQuery("select typename from tb_superType where ID="+type);
		if(rs_type.next()){
			typename=rs_type.getString(1);
		}
	}else{
		typename="全部分类";
		if(!key.equals("") && !key.equals(null)){
			sql="where GoodsName like '%"+key+"%'";
		}
	}
	sql="select * from V_goods "+sql;
	ResultSet rs_search=conn.executeQuery(sql);
	int goodsID=-1;
	String goodsName="";
	String introduce="";
	float nowprice=(float)0.0;
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
              <td height="80" background="images/center_searchresult.gif">&nbsp;</td>
              </tr>
            <tr valign="top">
              <td height="134" align="center"><table width="90%" height="23"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_B_dashed">
                    <tr>
                      <td height="23"> [<%=typename%>]&nbsp;查询关键字：[<%=key%>]</td>
                      </tr>
                  </table>
			  <%
	while(rs_search.next()){
	goodsID=rs_search.getInt("ID");
	goodsName=rs_search.getString("goodsName");
	introduce=rs_search.getString("introduce");
	nowprice=rs_search.getFloat("nowprice");
	if(introduce.length()>20){
	  introduce=introduce.substring(0,20)+"...";
	}
	%>
                  <table width="96%" height="23"  border="0" cellpadding="0" cellspacing="0" class="noborder">
                    <tr>
                      <td width="27%" height="23" style="padding-left:20px;"><a href="goods_detail.jsp?ID=<%=goodsID%>"><%=goodsName%></a>
					  </td>
                      <td width="50%"><%=introduce%></td>
                      <td width="14%" align="center"><%=nowprice%>(元)</td>
                      <%if (username!=null && username!=""){%>
					  <td width="9%" align="center">&nbsp;
						 <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?goodsID=<%=goodsID%>'" value="购买">
						</td>
						 <%}%> 
                    </tr>
                  </table>
				  <%}%>
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
<%conn.close();
}else{
	out.println("<script language='javascript'>alert('您的操作有误！');window.location.href='index.jsp';</script>");
}%>
