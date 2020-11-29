package com.wgh.dao;

import commerce.goods;
import com.wgh.DB.chStr;
import com.wgh.DB.connDB;

public class GoodsDaoImpl
    implements GoodsDao {
  connDB conn = new connDB();
  chStr chStr = new chStr();
  public int insert(goods g) {
    int ret = -1;
    try {
      String sql = "Insert into tb_goods (TypeID,GoodsName,Introduce,Price,nowPrice,picture,newgoods,sale) values(" +
          g.getTypeID() + ",'" + chStr.chStr(g.getGoodsName()) + "','" +
          chStr.chStr(g.getIntroduce()) + "'," + g.getPrice() + "," +
          g.getPrice() + ",'" + chStr.chStr(g.getPicture()) + "'," +
          g.getNewGoods() + "," + g.getSale() + ")";

      ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  public int update(goods g) {
    int ret = -1;
    try {
     String sql = "update tb_Goods set TypeID=" +g.getTypeID() +
         ",GoodsName='" + chStr.chStr(g.getGoodsName()) + "',introduce='" +
         chStr.chStr(g.getIntroduce()) + "',price=" + g.getPrice() +
         ",nowprice=" + g.getNowPrice() +",picture='" + chStr.chStr(g.getPicture())+ "',newgoods=" +
         g.getNewGoods() + ",sale=" + g.getSale() + " where ID=" + g.getID();
     ret = conn.executeUpdate(sql);
   }
   catch (Exception e) {
     ret = 0;
   }
   conn.close();
   return ret;
 }


  public int delete(goods g) {
    int ret=-1;
    try{
      String sql="Delete from tb_goods where ID="+g.getID();
      ret=conn.executeUpdate(sql);
    }catch(Exception e){
      ret=0;
    }
    conn.close();
    return ret;

  }

}
