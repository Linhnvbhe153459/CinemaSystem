/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Baoli
 */
public class UserDAO {

    public UserDAO() {
        connectDB();
    }

    //Khai báo thành phần xử lý CSDL
    Connection port;//Kết nối CSDL
    Statement stm;//Thực hiện các câu lệnh SQL
    ResultSet rs;//Lưu trữ và xử lý 

    private void connectDB() {
        try {
            port = (new DBContext()).getConnection();
            System.out.println("Connect successfully");
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public boolean checkLogin(String username, String password) {
        //Kiểm tra điều kiện login
        //Check account và pass có tồn tại trong DB không?
        try {
            stm = port.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from Account where username='" + username + "' and password='" + password + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("Login error:" + e.getMessage());
        }
        return false;
    }

    public String getNamebyAccount(String username) {
        try {
            stm = port.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from Account where username='" + username + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.err.println("Login error:" + e.getMessage());
        }
        return "";
    }
        public User getUserbyUsername(String username) {
        try {
            stm = port.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from Account where username='" + username + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                User u = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                return u;
            }   
        } catch (Exception e) {
            System.err.println("Login error:" + e.getMessage());
        }
        return null;
    }

    public boolean checkAccount(String account) {
        try {
            stm = port.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from tblUser where username='" + account + "'";
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("CheckAccount error:" + e.getMessage());
        }
        return false;
    }
    
    public ArrayList<User> getAllUser() {
       ArrayList<User> list = new ArrayList<User>();
       try {
            stm = port.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String strSelect = "select * from tblUser" ;
            rs = stm.executeQuery(strSelect);
            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString(1));
                u.setPassword(rs.getString(2));
                u.setAvatar(rs.getString(3));
                u.setDisplayname(rs.getString(4));
                SimpleDateFormat f= new SimpleDateFormat("dd/MM/yyyy");
                u.setDob(f.format(rs.getDate(5)));
                u.setEmail(rs.getString(6));
                u.setRoleID(rs.getString(7));
                list.add(u);
            }
        } catch (Exception e) {
            System.err.println("checkDOBbyAccount error:" + e.getMessage());
        }
       return list;
    }
}
