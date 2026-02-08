<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
  <form action="${pageContext.request.contextPath}/study" method="POST" class="study-form">

      <input type="text" id="title" name="title" maxlength="50" placeholder="Title">
   
      <input type="text" id="subject" name="subject" maxlength="30" placeholder="Subject">
      <div class="field">
        <label for="language">Preferred Language</label>
        <select id="language" name="language" required>
          <option value="" disabled selected>Select a language</option>
          <option value="English">English</option>
          <option value="Dutch">Dutch</option>
          <option value="Greek">Greek</option>
          <option value="Arabic">Arabic</option>
          <option value="Italian">Italian</option>
          <option value="German">German</option>
          <option value="Spanish">Spanish</option>
        </select>
      </div>
      
        <textarea id="description" name="description" maxlength="150" placeholder="Description"></textarea>
        <button type="submit" class="submit-btn" style="margin-top: 10px; padding: 10px; background-color: #040a67; color: white; border: none; border-radius: 4px; cursor: pointer;">
            Submit </button>
    </form>
  </body>
</html>