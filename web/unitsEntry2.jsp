<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Units of production</title>
        <style>
            body{
                text-align: center;
                background-color: powderblue;
                line-height: 250%;
            }
            table{
                background-color: darkgray;
                margin: auto;
                border: 4px solid darkgray;
                line-height: 500%;
                
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
        <p style="font-family: calibri;font-size: 20px">Enter units consumed per each year:</p>
        <br />
        <form action="unitsOfProduction.jsp">
        <table>
            <tr>
                <td>
                    YEAR
                </td>
                <td>
                    UNITS CONSUMED
                </td>
            </tr>
        <%
            try{     
                String totalUnits = request.getParameter("totalUnits");
                if(totalUnits == null ||
                        Integer.parseInt(totalUnits) <= 0){
                    throw new Exception();
                }
                
                %>
                <p style="font-family: calibri;font-size: 20px">Hint: the sum in all boxes must be equal to 
                <%
                    out.print(totalUnits + " ");
                    %>
                    units!
                </p>
                    <%
                for (int i = 0; i < Integer.parseInt(request.getParameter("life")); i++){
                %>
                <tr>
                    <td>
                        <% out.print(i + 1); %>
                    </td>
                    <td>
                        <input type="text" name="<%= "year" + (i + 1) %>" />
                    </td>
                </tr>
                <%
            }
            %>
            <input type="hidden" name="cost" value="<%= request.getParameter("cost")%>">
            <input type="hidden" name="scrap" value="<%= request.getParameter("scrap")%>">
            <input type="hidden" name="life" value="<%= request.getParameter("life")%>">
            <input type="hidden" name="totalUnits" value="<%= request.getParameter("totalUnits")%>">
            <%
                } catch (Exception e){
                    request.getRequestDispatcher("invalidData.jsp").forward(request, response);
                }
                %>
        </form>
        </table>
        <input style="font-family: calibri; font-size: 20px; background-color: lightgreen" type="submit" value = "Submit" />
    </body>
</html>
