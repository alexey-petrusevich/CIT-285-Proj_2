<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sum of the Years Digits</title>
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
        <h1>SUM-OF-THE-YEARS-DIGITS</h1>
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
            // number format for two double digits precision
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMinimumFractionDigits(2);
            nf.setMaximumFractionDigits(2);
            double life = Double.parseDouble(request.getParameter("life"));
            double cost = Double.parseDouble(request.getParameter("cost"));
            double scrap = Double.parseDouble(request.getParameter("scrap"));
            double sumOfYears = life * (life + 1) / 2;
            double depreciation = 0;
            double accumDepreciation = 0;
            for (int i = 0; i < life; i++){
                depreciation = ((life - i) / sumOfYears) * (cost - scrap);
                accumDepreciation += depreciation;
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
