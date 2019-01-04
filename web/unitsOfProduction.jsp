<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Units of Production</title>
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
        <h1>UNITS OF PRODUCTION</h1>
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
            try{
                // create a number format for two digit precision
                NumberFormat nf = NumberFormat.getInstance();
                nf.setMaximumFractionDigits(2);
                nf.setMinimumFractionDigits(2);
                double cost = Double.parseDouble(request.getParameter("cost"));
                double scrap = Double.parseDouble(request.getParameter("scrap"));
                double life = Double.parseDouble(request.getParameter("life")); // used in for loop
                int totalUnits = Integer.parseInt(request.getParameter("totalUnits"));
                double depreciationPerUnit = (cost - scrap) / totalUnits;
                double depreciation = 0;
                double accumDepreciation = 0;
                for (int i = 0; i < life; i++){
                    depreciation = Double.parseDouble(request.getParameter("year" + (i + 1))) * depreciationPerUnit;
                    if (depreciation < 1E-14){ // if user entered negative value of units consumed in one year
                        throw new Exception();
                    }
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
                if ((accumDepreciation / depreciationPerUnit) != totalUnits){
                    throw new Exception();
                }
            } catch (Exception e){
                request.getRequestDispatcher("invalidData.jsp").forward(request, response);
            }
        %>
        </table>
        <form action="index.html">
            <input style="font-family: calibri; font-size: 20px; background-color: lightgreen"type="submit" value = "Main menu">
        </form>
    </body>
</html>
