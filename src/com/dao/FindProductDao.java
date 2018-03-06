package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zxy on 2016/12/29.
 */
public class FindProductDao {

    public static ResultSet findProduct(Connection conn, String ordernumber) throws SQLException {

        ResultSet rs = null;
        java.sql.PreparedStatement preparedStmt = null;
//        String sql = "select * from product where ordernumber = '"+ordernumber+"'";
//        String sql = "select distinct a.fbillno as ordernumber,c.fname as productname,c.fnumber as materiacode,b.fentryselfp0244+Isnull(c.FModel,'')as model,b.FQty as number,d.FName as department,f.FDescription as applicant,g.FEntrySelfP0132 as project from (((((POOrder a inner join POOrderEntry b on a.FInterID=b.FInterID) inner join t_icitem c on b.fitemid = c.FItemID) inner join t_Department d on b.FEntrySelfP0245 = d.FItemID)inner join PORequest e on b.FSourceBillNo = e.FBillNo)inner join t_user f on e.FBillerID = f.FUserID)inner join PORequestEntry g on b.FSourceInterId = g.FInterID where a.FBillNo = '" + ordernumber + "'";
        String sql = "select distinct a.fbillno as ordernumber,c.fname as productname,c.fnumber as materiacode,b.fentryselfp0244+Isnull(c.FModel,'')as model,b.FQty as number,d.FName as department,f.FDescription as applicant,g.FEntrySelfP0132 as project from (((((POOrder a inner join POOrderEntry b on a.FInterID=b.FInterID) inner join t_icitem c on b.fitemid = c.FItemID) inner join t_Department d on b.FEntrySelfP0245 = d.FItemID) left join PORequest e on b.FSourceBillNo = e.FBillNo) left join t_user f on e.FBillerID = f.FUserID) left join PORequestEntry g on b.FSourceInterId = g.FInterID  and b.fsourceentryid=g.fentryid where a.FBillNo = '" + ordernumber + "'";

        preparedStmt = conn.prepareStatement(sql);
        rs = preparedStmt.executeQuery();

        return rs;
    }

}
