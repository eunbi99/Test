<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set value="${pageContext.request.contextPath }" var="contextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		function linkModifyForm() {
			document.modForm.submit();
		}
	</script>
	
	<script type="text/javascript">
		function searchlist() {
			document.searchForm.submit();
		}
	</script>
	
	<script type="text/javascript">
		function deletemember(){
			document.deleteForm.submit();
		}
	</script>
</head>
<body>
	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	
<!-- 로그인 안 했을 때 -->	
	<c:if test="${empty loginMember }">
		<a class="navbar-brand" href="#">uth</a>
	</c:if>
<!-- /로그인 안 했을 때 -->	
<!-- 로그인 했을 때 -->	
	<c:if test="${not empty loginMember }">
		<a class="navbar-brand" href="#"><b>${loginMember.member_name }</b>님 안녕하세요! </a>
	</c:if>
<!-- /로그인 했을 때 -->	
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#">홈 <span class="sr-only">(current)</span></a>
				</li>
			<c:if test="${not empty loginMember }">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						회원정보
					</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				
				<!-- 회원 정보 변경 기능 추가하기 -->
				<form action="${contextPath }/member/modify" method="get" name="modForm">
					<input type="hidden" name="member_id" value="${loginMember.member_id }">
					<a class="dropdown-item" href="javascript:linkModifyForm();">회원정보 변경하기</a>
				</form>				
				<!-- /회원 정보 변경 기능 추가하기 -->				
		
				<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${contextPath }/member/logout">로그아웃</a>
				</div>
				</li>
			</c:if>
			<c:if test="${empty loginMember }">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						로그인하세요!
					</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="${contextPath }/member/login">로그인</a>
		
				<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${contextPath }/member/join">회원가입</a>
				</div>
				</li>
			</c:if>				
			</ul>
			<!-- 회원 찾기 기능 -->			
			<form class="form-inline my-2 my-lg-0" name="searchForm" action="${contextPath }/member/list" method="get">
				<select name="type" class="form-control mr-sm-2">
					<option value="" <c:out value="${cri.type==null?'selected':''}"/>>---</option>
					<option value="id" <c:out value="${cri.type eq 'id'?'selected':''}"/>>아이디</option>
					<option value="name" <c:out value="${cri.type eq 'name'?'selected':''}"/>>이름</option>
					<option value="email" <c:out value="${cri.type eq 'email'?'selected':''}"/>>이메일</option>
				</select>
				<input class="form-control mr-sm-2" type="text" name="keyword" 
					placeholder="Search" aria-label="Search" value='<c:out value="${cri.keyword }"/>'>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchBtn" onclick="javascript:searchlist();">회원찾기</button>
			</form>
			<!-- /회원 찾기 기능 -->			
		</div>
	</nav>
	<!-- /네비게이션 바 -->

	<!-- 멤버 리스트 -->      
	<div class="container-fluid">
		<div class="row navbar-expand-md">
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
		<h2>회원목록</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
						<td>#</td>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberlist }" var="member">
							<tr>
							<c:choose>
								<c:when test="${member.member_id eq loginMember.member_id }">
									<td><span data-toggle="modal" data-target="#exampleModal"><i class="far fa-user-circle"></i></span></td>
								</c:when>
								<c:otherwise>
									<td>#</td>
								</c:otherwise>
							</c:choose>
							<td><c:out value="${member.member_id }"/></td>
							<td><c:out value="${member.member_name }"/></td>
							<td><c:out value="${member.member_email }"/></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${member.regdate }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
		</div>
	</div>
	<!-- /멤버 리스트 -->
	
	<!-- 모달창 기능 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">회원 정보</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		  	<b>아이디</b> : <c:out value="${loginMember.member_id }"/><br>
		  	<b>이 름</b> :  <c:out value="${loginMember.member_name }"/><br>
		  	<b>이메일</b> : <c:out value="${loginMember.member_email }"/><br>
		  	<b>가입일</b> : <fmt:formatDate pattern="yyyy/MM/dd" value="${loginMember.regdate }"/><br>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-danger" onclick="javascript:deletemember();">탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>
	<form name="deleteForm" method="post" action="${contextPath }/member/delete">
		<input type="hidden" name="delete_id" value="${loginMember.member_id }">
	</form>

</body>
</html>