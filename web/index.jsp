<%-- 
    Document   : index
    Created on : Mar 28, 2017, 1:40:21 PM
    Author     : MH0411
--%>

<%@page import="dbConn1.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>  
        <h1>Hello World!</h1>
        <% 
    String sql3 = "SELECT DISTINCT "
            + "pb.PATIENT_NAME, "
            + "pb.HOME_ADDRESS, "
            + "pb.NEW_IC_NO, "
            + "pb.ID_NO, "
            + "pb.MOBILE_PHONE, "
            + "NOW(), "
            + "pdd.DRUG_ITEM_CODE, "
            + "mdc.D_TRADE_NAME, "
            + "pdd.DISPENSED_QTY, "
            + "mdc.D_PRICE_PPACK, "
            + "(pdd.DISPENSED_QTY * mdc.D_PRICE_PPACK) AS TOTAL, "
            + "pb.ID_TYPE "
            + "FROM pms_episode pe "
            + "INNER JOIN pms_patient_biodata pb "
            + "ON pe.PMI_NO = pb.PMI_NO "
            + "INNER JOIN pis_order_master pom "
            + "ON pe.PMI_NO = pom.PMI_NO "
            + "INNER JOIN pis_dispense_master pdm "
            + "ON pom.ORDER_NO = pdm.ORDER_NO "
            + "INNER JOIN pis_dispense_detail pdd "
            + "ON pdm.ORDER_NO = pdd.ORDER_NO "  
            + "INNER JOIN pis_mdc2 mdc "
            + "ON pdd.DRUG_ITEM_CODE = mdc.UD_MDC_CODE "
            + "WHERE pe.PMI_NO = '9304110852311'";
        ArrayList<ArrayList<String>> data = Conn.getData(sql3);%>
        <h2><%=data.get(0).get(5)%></h2>
    </body>
</html>
