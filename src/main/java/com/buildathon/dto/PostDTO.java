package com.buildathon.dto;

import java.util.List;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PostDTO {
    private int postId;
    private int userId;
    private String username;
    private String title;
    private String content;
    private String imageUrl;
    private Timestamp createdAt;
    private String time;
    private String date;

    // ADD THIS FIELD
    private List<CommentDTO> comments = new ArrayList<>(); 

    public PostDTO() {}

    public List<CommentDTO> getComments() {
        return comments;
    }

    public void setComments(List<CommentDTO> comments) {
        // EXTRA SAFETY: Ensure we never set it to null
        this.comments = (comments != null) ? comments : new ArrayList<>();
    }


    public int getPostId() {
        return postId;
    }



    public void setPostId(int postId) {
        this.postId = postId;
    }



    public int getUserId() {
        return userId;
    }



    public void setUserId(int userId) {
        this.userId = userId;
    }



    public String getUsername() {
        return username;
    }



    public void setUsername(String username) {
        this.username = username;
    }



    public String getTitle() {
        return title;
    }



    public void setTitle(String title) {
        this.title = title;
    }



    public String getContent() {
        return content;
    }



    public void setContent(String content) {
        this.content = content;
    }



    public String getImageUrl() {
        return imageUrl;
    }



    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }



    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
        LocalDateTime dt = createdAt.toLocalDateTime();
        this.time = dt.format(DateTimeFormatter.ofPattern("h:mm a"));
        this.date = dt.format(DateTimeFormatter.ofPattern("MMM d, yyyy"));
    }
}