<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>게시글 목록</title>
</head>
<body>
<script>
function search(){

}
</script>
<h2>게시글 목록</h2>
<form name="form1" method="post" action="/list.do">
	<select name="searchOption">
		<option value="all" <c:out value="${map.selectOption == 'all'?'selectd':''}"/> >제목+이름+내용 </option>
		<option value="writer" <c:out value="${map.selectOption == 'writer'?'selectd':''}"/> >이름</option>
		<option value="content" <c:out value="${map.selectOption == 'content'?'selectd':''}"/> >내용 </option>
		<option value="title" <c:out value="${map.selectOption == 'title'?'selectd':''}"/> >제목</option>	
	</select>
	<input type="text" name="keyword" value="${map.keyword}">
	<input type="submit" name="submit" value="조회">
	<button type="button" id="btnWrite">글쓰기</button>
</form>
${fn:length(list)}개의 게시물이 있습니다.

<p><a href="write.do">글쓰기</a> 
<table border="1" width="600px">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>이름</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<c:choose>
    <c:when test="${fn:length(list) == 0}"> 
       	<tr > <td colspan="5" style="text-align: center;">조회결과가 없습니다.</td></tr>
    </c:when>
     <c:otherwise>
<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.num}</td>
		<td><a href="${path}/board/view.do?num=${row.num}">${row.title}</a></td>
		<td>${row.writer}</td>
		<td>	
			<fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/>
		</td>
		<td>${row.readcount}</td>
	</tr>
</c:forEach>  
 </c:otherwise> 
</c:choose>
</table>
</body>
</html>