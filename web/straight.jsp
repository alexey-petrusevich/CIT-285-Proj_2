<%-- import number format for precision --%>
<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Straight</title>
        <style>
            body{
                text-align: center;
                background-color: powderblue;
                line-height: 500%;
            }
            table{
                background-color: darkgray;
                margin: auto;
                border: 4px solid darkgray;

                
            }
            th, td{
                background-color: orange;
                border: 4px solid gray;
                padding: 10px;
                width: 300px;
                border-collapse: collapse;
            }
            button{
                font-family: calibri;
                font-size: 20px;
                background-color: salmon;
            }
        </style>
    </head>
    <body>
        <h1>STRAIGHT-LINE</h1>
        <hr />
        <table>
            <tr>
                <td>
                    YEAR
                </td>
                <td>
                    DEPRECIATION
                </td>
                <td>
                    ACCUM. DEPRECIATION
                </td>
            </tr>
        <%
            // create a number format for two digit precision
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
            nf.setMinimumFractionDigits(2);
            double cost = Double.parseDouble(request.getParameter("cost"));
            double scrap = Double.parseDouble(request.getParameter("scrap"));
            double life = Double.parseDouble(request.getParameter("life"));
            double depreciation = (cost - scrap) / life;
            double accumDepreciation = 0;
            for (int i = 0; i < life; i++){
                accumDepreciation+=depreciation;
        %>
        <tr>
            <td>
                <% out.print(i + 1); %>
            </td>
            <td>
                <% out.print(nf.format(depreciation)); %>
            </td>
            <td>
                <% out.print(nf.format(accumDepreciation)); %>
            </td>
        </tr>
        <%  
            }
        %>
        </table>
        <form action="index.html">
            <input style="font-family: calibri; font-size: 20px; background-color: lightgreen"type="submit" value = "Main menu">
        </form>
    </body>
</html>
