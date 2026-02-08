package com.buildathon.servlet;

import com.buildathon.dao.CommentDAO;
import com.buildathon.dao.CommunityDAO;
import com.buildathon.dto.CommentDTO;
import com.buildathon.dto.PostDTO;

import javax.servlet.annotation.MultipartConfig; 
import javax.servlet.http.Part; 
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
@WebServlet("/community")
public class CommunityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Instantiate the DAO to handle database operations
    private CommunityDAO communityDAO = new CommunityDAO();

   // Inside CommunityServlet.java
    private CommentDAO commentDAO = new CommentDAO();
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<PostDTO> postList = communityDAO.selectAllPosts();
            CommentDAO commentDAO = new CommentDAO();
            
            // Loop through and attach comments to each post
            if (postList != null) {
                for (PostDTO post : postList) {
                    List<CommentDTO> comments = commentDAO.getComments(post.getPostId(), "community");
                    if (comments != null) {
                        post.setComments(comments);
                    } else {
                        post.setComments(new ArrayList<>()); // Fallback to empty list
                    }
                }
            }
            
            request.setAttribute("postList", postList);
            request.getRequestDispatcher("/views/community.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        try {
            // 1. Get text parameters
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            // 2. Handle File Upload
            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();
            String imageUrl = null;

            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                filePart.write(uploadPath + File.separator + fileName);
                imageUrl = "uploads/" + fileName;
            }

            // 3. Create DTO
            PostDTO newPost = new PostDTO();
            newPost.setUserId(1); // Placeholder: Use session user ID after login
            newPost.setTitle(title);
            newPost.setContent(content);
            newPost.setImageUrl(imageUrl);

            // 4. Insert into DB (ONLY CALL THIS ONCE)
            boolean isSuccess = communityDAO.insertPost(newPost);

            // 5. Send ONE response
            if (isSuccess) {
                response.sendRedirect(request.getContextPath() + "/community");
                return; // Important: Stop execution here so the later code doesn't run
            } else {
                response.getWriter().println("Database insertion failed. Check your server console for SQL errors.");
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
            if (!response.isCommitted()) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create post.");
            }
        }
    }
}