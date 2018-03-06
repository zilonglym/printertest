package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Product;
import com.dao.DBHelper;
import com.dao.FindProductDao;

/**
 * Created by zxy on 2016/12/29.
 */

public class FindProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        ResultSet rs = null;
        conn = DBHelper.getConn();
        String str[] = request.getParameterValues("textfield");


        List<Product> list = new ArrayList<Product>();

        try {
            if (str != null) {
                int size = java.lang.reflect.Array.getLength(str);

                for (int i = 0; i < size; i++) {
                    if (!(str[i] == null || str[i].length() <= 0)) {

                        rs = FindProductDao.findProduct(conn,str[i]);
                        while (rs.next()) {
                            Product product = new Product();
                            product.setOrdernumber(rs.getString("ordernumber"));
                            product.setProductname(rs.getString("productname"));
                            product.setMateriacode(rs.getString("materiacode"));
                            product.setModel(rs.getString("model")==null?"":rs.getString("model"));
                            product.setNumber(rs.getInt("number"));
                            product.setDepartment(rs.getString("department"));
                            product.setApplicant(rs.getString("applicant")==null?"":rs.getString("applicant"));
                            product.setProject(rs.getString("project")==null?"":rs.getString("project"));
//                            System.out.println(rs.getString("ordernumber"));
                            list.add(product);


                        }
//                        System.out.println(str[i]);
                    }
                }
//                for (int i = 0; i < list.size(); i++){ System.out.println(list.get(i).getOrdernumber());}
                System.out.println(list.size());

            }
            request.setAttribute("list", list);
            request.getRequestDispatcher("/find.jsp").forward(request, response);


        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(conn);
            System.out.println("数据库连接关闭");
            out.flush();
            out.close();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
