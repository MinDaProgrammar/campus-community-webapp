package com.buildathon.dao;

import com.buildathon.dto.PostDTO;
import com.buildathon.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommunityDAO {
    //GETTER METHOD
    public List<PostDTO> selectAllPosts() {
        List<PostDTO> posts = new ArrayList<>();
        // Use LEFT JOIN to ensure posts show even if user data is missing
        String sql = "SELECT p.*, u.username FROM community_board p LEFT JOIN users u ON p.user_id = u.user_id ORDER BY p.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                PostDTO post = new PostDTO();
                post.setPostId(rs.getInt("post_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setUsername(rs.getString("username") != null ? rs.getString("username") : "Unknown User");
                post.setImageUrl(rs.getString("image_url")); // MUST ADD THIS
                post.setCreatedAt(rs.getTimestamp("created_at"));
                posts.add(post);
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return posts;
    }

    //INSERT METHOD
    public boolean insertPost(PostDTO post) {
        String sql = "INSERT INTO community_board (user_id, title, content, image_url) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, post.getUserId());
            pstmt.setString(2, post.getTitle());
            pstmt.setString(3, post.getContent());
            pstmt.setString(4, post.getImageUrl()); // Can be null if no image is uploaded
            
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}