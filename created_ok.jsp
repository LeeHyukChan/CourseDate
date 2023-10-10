<%@ page import="com.board.BoardDAO" %>
<%@ page import="com.util.DBConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.board.BoardDTO" scope="page" />
<jsp:setProperty property="*" name="dto" />

<%
    Connection conn = DBConn.getConnection();
    BoardDAO dao = new BoardDAO(conn);

    int maxNum = dao.getMaxNum();

    try {
        int Gtotal = dao.IdCheck(dto);

        if (Gtotal > 0) {
            pageContext.setAttribute("alertMessage", "정상적으로 리뷰 작성이 완료되었습니다.");
        } else {
            pageContext.setAttribute("alertMessage", "아이디가 존재하지 않아 리뷰 작성이 완료되지 않았습니다.");
        }
    } catch (Exception e) {
        System.out.println(e.toString());
        pageContext.setAttribute("alertMessage", "오류가 발생하여 리뷰 작성이 완료되지 않았습니다.");
    }

    dto.setNum(maxNum + 1);

    dao.insertData(dto);

    DBConn.close();

    response.sendRedirect("review.jsp");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성 결과</title>
</head>
<body>
    <script>
        // Display the alert message using JSTL variable
        var alertMessage = "${alertMessage}";
        alert(alertMessage);
    </script>
</body>
</html>
