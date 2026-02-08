package com.buildathon.dao;

import com.buildathon.dto.CommentDTO;
import com.buildathon.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    public List<CommentDTO> getComments(int postId, String boardType) {
        List<CommentDTO> list = new ArrayList<>();
        String sql = "SELECT c.*, u.username FROM comments c " +
                     "JOIN users u ON c.user_id = u.user_id " +
                     "WHERE c.post_id = ? AND c.board_type = ? " +
                     "ORDER BY c.created_at ASC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, postId);
            pstmt.setString(2, boardType);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                CommentDTO dto = new CommentDTO();
                dto.setUsername(rs.getString("username"));
                dto.setCommentText(rs.getString("comment_text"));
                list.add(dto);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Inside src/main/java/com/buildathon/dao/CommentDAO.java

    public boolean insertComment(int userId, int postId, String boardType, String commentText) {
        String sql = "INSERT INTO comments (user_id, post_id, board_type, comment_text) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            pstmt.setInt(2, postId);
            pstmt.setString(3, boardType);
            pstmt.setString(4, commentText);
            
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}