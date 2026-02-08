<%-- buildathon/src/main/webapp/views/search.jsp --%>
<form class="search" action="${pageContext.request.contextPath}/study" method="GET">
    <input type="text" placeholder="Search..." name="search" value="${param.search}">
    <button class="button_search" type="submit" aria-label="Search">
        <i class="fa fa-search" aria-hidden="true"></i>
    </button>
</form>