package com.buildathon.dao;

import com.buildathon.dto.StudyBuddyDTO;
import com.buildathon.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudyBuddyDAO {

    public List<StudyBuddyDTO> selectAllBuddies() {
        List<StudyBuddyDTO> buddies = new ArrayList<>();
        String sql = "SELECT b.*, u.username FROM study_buddy_board b " +
                     "LEFT JOIN users u ON b.user_id = u.user_id ORDER BY b.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                StudyBuddyDTO buddy = new StudyBuddyDTO();
                buddy.setBuddyId(rs.getInt("buddy_id"));
                buddy.setUsername(rs.getString("username") != null ? rs.getString("username") : "Unknown");
                buddy.setTitle(rs.getString("title"));
                buddy.setSubject(rs.getString("subject")); // New field
                buddy.setPreferredLanguage(rs.getString("preferred_language")); // New field
                buddy.setContent(rs.getString("content"));
                buddy.setCreatedAt(rs.getTimestamp("created_at"));
                buddies.add(buddy);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return buddies;
    }

    public boolean insertBuddy(StudyBuddyDTO buddy) {
        String sql = "INSERT INTO study_buddy_board (user_id, title, subject, preferred_language, content) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, 1); // Placeholder for user_id
            pstmt.setString(2, buddy.getTitle());
            pstmt.setString(3, buddy.getSubject());
            pstmt.setString(4, buddy.getPreferredLanguage());
            pstmt.setString(5, buddy.getContent());
            
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<StudyBuddyDTO> searchBuddies(String keyword) {
        List<StudyBuddyDTO> buddies = new ArrayList<>();
        // Use %?% for partial matching across multiple columns
        String sql = "SELECT b.*, u.username FROM study_buddy_board b " +
                     "LEFT JOIN users u ON b.user_id = u.user_id " +
                     "WHERE b.title LIKE ? OR b.subject LIKE ? OR b.preferred_language LIKE ? OR b.content LIKE ? " +
                     "ORDER BY b.created_at DESC";
    
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            pstmt.setString(4, searchPattern);
    
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    StudyBuddyDTO buddy = new StudyBuddyDTO();
                    buddy.setBuddyId(rs.getInt("buddy_id"));
                    buddy.setUsername(rs.getString("username") != null ? rs.getString("username") : "Unknown");
                    buddy.setTitle(rs.getString("title"));
                    buddy.setSubject(rs.getString("subject"));
                    buddy.setPreferredLanguage(rs.getString("preferred_language"));
                    buddy.setContent(rs.getString("content"));
                    buddy.setCreatedAt(rs.getTimestamp("created_at"));
                    buddies.add(buddy);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return buddies;
    }
}