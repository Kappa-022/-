package com.wgh.DB;

import java.sql.*;
import java.io.*;
import java.util.*;

public class connDB {
  public Connection conn = null;
  public Statement stmt = null;
  public ResultSet rs = null;
  private static String propFileName = "C:/connDB.properties";
  private static Properties prop = new Properties();
  private static String dbClassName =
      "com.microsoft.jdbc.sqlserver.SQLServerDriver";
  private static String dbUrl =
      "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_shop";
  private static String dbUser = "sa";
  private static String dbPwd = "";
  private static void loadProperty() {
    try {
      prop.load(new FileInputStream(propFileName));  //通过文件输入流对象加载Properties文件
      dbClassName = prop.getProperty("DB_CLASS_NAME");
      dbUrl = prop.getProperty("DB_URL",
                               "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_shop");
      dbUser = prop.getProperty("DB_USER", "sa");
      dbPwd = prop.getProperty("DB_PWD", "");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static Connection getConnection() {
    Connection conn = null;
    loadProperty();
    try {
      Class.forName(dbClassName).newInstance();
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
    }
    catch (Exception ee) {
      ee.printStackTrace();
    }
    if (conn == null) {
      System.err.println(
          "警告: DbConnectionManager.getConnection() 获得数据库链接失败.\r\n\r\n链接类型:" +
          dbClassName + "\r\n链接位置:" + dbUrl + "\r\n用户/密码" + dbUser + "/" +
          dbPwd);
    }
    return conn;
  }

  /*
   *功能：执行查询语句
   */
  public ResultSet executeQuery(String sql) {
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_READ_ONLY);
      rs = stmt.executeQuery(sql);
    }
    catch (SQLException ex) {
      System.err.println(ex.getMessage());
    }
    return rs;
  }

  /*
   *功能:执行更新操作
   */
  public int executeUpdate(String sql) {
    int result = 0;
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_READ_ONLY);
      result = stmt.executeUpdate(sql);
    }
    catch (SQLException ex) {
      result = 0;
    }
    try {
      stmt.close();
    }
    catch (SQLException ex1) {
    }
    return result;
  }

  public int executeUpdate_id(String sql) {
    int result = 0;
    try {
      conn = getConnection();
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                  ResultSet.CONCUR_READ_ONLY);
      result = stmt.executeUpdate(sql);
      String ID = "select @@IDENTITY as id";
      rs = stmt.executeQuery(ID);
      if (rs.next()) {
        int autoID = rs.getInt("id");
        result = autoID;
      }
    }
    catch (SQLException ex) {
      result = 0;
    }
    return result;
  }

  /*
   *功能:关闭数据库的连接
   */
  public void close() {
    try {
      if (rs != null) {
        rs.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
    try {
      if (stmt != null) {
        stmt.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
    try {
      if (conn != null) {
        conn.close();
      }
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
  }

}
