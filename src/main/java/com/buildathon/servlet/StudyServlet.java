package com.buildathon.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buildathon.dao.StudyBuddyDAO;
import com.buildathon.dto.StudyBuddyDTO;

@WebServlet("/study")
public class StudyServlet extends HttpServlet {   
    private StudyBuddyDAO studyDAO = new StudyBuddyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String keyword = request.getParameter("search");
        List<StudyBuddyDTO> buddyList;

        if (keyword != null && !keyword.trim().isEmpty()) {
            // Fetch filtered results
            buddyList = studyDAO.searchBuddies(keyword);
        } else {
            // Fetch all results if no search is performed
            buddyList = studyDAO.selectAllBuddies();
        }

        request.setAttribute("buddyList", buddyList);
        request.getRequestDispatcher("/views/study.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        StudyBuddyDTO buddy = new StudyBuddyDTO();
        buddy.setTitle(request.getParameter("title"));
        buddy.setSubject(request.getParameter("subject")); // Matches 'name' in study_post.jsp
        buddy.setPreferredLanguage(request.getParameter("language")); // Matches 'name' in study_post.jsp
        buddy.setContent(request.getParameter("description")); // Matches 'name' in study_post.jsp

        if (studyDAO.insertBuddy(buddy)) {
            response.sendRedirect(request.getContextPath() + "/study");
        } else {
            response.sendError(500, "Failed to create study post.");
        }
    }

    
}