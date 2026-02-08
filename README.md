# Campus Community Web App — 48H Buildathon (Java Servlets, JSP, MySQL)

A student community platform for the Department of Advanced Computing Sciences, built by a team of five in 48 hours at the **48H Buildathon** (Maastricht University, February 2026).

## Features

- **Home page** with announcement cards for faculty and student-association events
- **Community board:** create posts with an optional image upload, list them newest first, and comment on them
- **Study buddy board:** post a request with subject and preferred language, and search across title, subject, language and content
- Shared navbar, footer and search components

## Architecture

Classic MVC on the Java Servlet API:

```
src/main/java/com/buildathon/
├── servlet/   # controllers: Main, Community, Study, Comment, Login
├── dao/       # JDBC data access with prepared statements
├── dto/       # Post, Comment, StudyBuddy, User
└── util/      # DBConnection
src/main/webapp/
├── views/     # JSP pages (JSTL) and shared fragments
├── css/  js/  images/
```

## Running locally

Requires Java 21, Maven, MySQL and a servlet container such as Apache Tomcat 9 (`javax.servlet`).

```bash
mysql -u root -p < schema.sql
# set your MySQL password in src/main/java/com/buildathon/util/DBConnection.java
mvn clean package
# deploy target/buildathon.war to Tomcat, then open http://localhost:8080/buildathon
```

## My role

I set up the project skeleton (Maven, Servlet/JSP structure, MySQL connection) and built the database layer: the DAOs and DTOs, and the post, comment and study-buddy insert/read logic behind the community and study boards. Teammates built most of the front end (pages, styling, navigation, filters).

**Team:** Minseok Choi, Tami Vadász, Ece Sinanoglu and teammates.
<!-- TODO(Minseok): add the other two teammates' names -->

## Limitations

Built in 48 hours: login is a placeholder (posts are made as user 1), and `schema.sql` was reconstructed from the DAO queries afterwards for running the app locally.

Event posters on the home page belong to MSV Incognito and the Faculty of Science and Engineering.
