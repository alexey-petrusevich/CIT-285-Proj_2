<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirect</title>
    </head>
    <body>
        <%
            try{
                if (
                        Double.parseDouble(request.getParameter("cost")) <= 1E-14 ||
                        Double.parseDouble(request.getParameter("scrap")) <= 1E-14 ||
                        Double.parseDouble(request.getParameter("life")) <= 1E-14 ||
                        Double.parseDouble(request.getParameter("cost")) < Double.parseDouble(request.getParameter("scrap"))
                        ){ // if any of the values are 0 or negative or scrap is greater than cost throw an exception
                    throw new Exception();
                }
                switch(request.getParameter("select")){
                case "straight":
                    // forward request to straight line method jsp
                    request.getRequestDispatcher("straight.jsp").forward(request, response);
                    break;
                case "sumOfTheYearsDigits":
                    // forward request to sum of the year digits jsp
                    request.getRequestDispatcher("sumOfTheYearsDigits.jsp").forward(request, response);
                    break;
                case "unitsOfProduction":
                    // forward request to units of production jsp
                    request.getRequestDispatcher("unitsEntry.jsp").forward(request, response);
                    break;
                case "doubleDecliningBalance":
                    request.getRequestDispatcher("doubleDecliningBalance.jsp").forward(request, response);
                    break;
                }
            } catch (Exception e){ // if any excpetions thrown send to invalid data jsp
                request.getRequestDispatcher("invalidData.jsp").forward(request, response);
            }
            
        %>
    </body>
</html>
