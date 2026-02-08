package com.buildathon.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserDTO implements Serializable {
    private int userId;
    private String username;
    private String email;
    private Timestamp createdAt;

    // Constructors
    public UserDTO() {}
    public UserDTO(int userId, String username, String email) {
        this.userId = userId;
        this.username = username;
        this.email = email;
    }

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}