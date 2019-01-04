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
        <p style="font-family: calibri;font-size: 20px">Enter total units consumed during asset's life: </p>
        <br />
        <form action="unitsEntry2.jsp">
            <input type="text" name="totalUnits"/>
            <br />
            <input type="hidden" name = "cost" value="<%= request.getParameter("cost")%>" />
            <input type="hidden" name = "scrap" value="<%= request.getParameter("scrap")%>" />
            <input type="hidden" name = "life" value="<%= request.getParameter("life")%>" />
            <input style="font-family: calibri; font-size: 20px; background-color: lightgreen" type ="submit" value="Submit" />
        </form>
    </body>
</html>
