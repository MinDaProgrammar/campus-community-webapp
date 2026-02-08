package com.buildathon.servlet;

import com.buildathon.dao.CommentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addComment")
public class CommentServlet extends HttpServlet {
    private CommentDAO commentDAO = new CommentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Set character encoding to handle special characters
        request.setCharacterEncoding("UTF-8");

        // 2. Retrieve data from the form
        int postId = Integer.parseInt(request.getParameter("postId"));
        String boardType = request.getParameter("boardType");
        String commentText = request.getParameter("commentText");

        // 3. For now, hardcode user_id as 1 (until login is implemented)
        int userId = 1;

        // 4. Call DAO to insert the comment
        boolean isSuccess = commentDAO.insertComment(userId, postId, boardType, commentText);

        // 5. Redirect back to the correct board (e.g., /community)
        if (isSuccess) {
            response.sendRedirect(request.getContextPath() + "/" + boardType);
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add comment.");
        }
    }
}