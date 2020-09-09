<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>게시글 작성</title>
<script>
   $(document).ready(function(){
      $("#btnDelete").click(function(){
         if(confirm("삭제하시겠습니까?")){
            document.form1.action="${path}/board/delete.do";
            document.form1.submit();
            
            }
         });
      
      $("#btnUpdate").click(function(){
         var title = $("#title").val();
         var content = $("content").val();
         var writer = $("writer").val();
         if(title ==""){
            alert("제목을 입력하세요.");
            document.form1.title.focus();
            return;
            }
         if(title ==""){
            alert("내용을 입력하세요.");
            document.form1.content.focus();
            return;
            }
         if(title ==""){
            alert("이름을 입력하세요.");
            document.form1.writer.focus();
            return;
            }
         document.form1.action="${path}/board/update.do";
         document.form1.submit();
         });
   });
</script>
</head>
<body>
<h2>게시글 보기</h2>
<form name="form1" method="post">
	<div>
		작성일자: <fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd a HH:mm:ss"/>
	</div>
	<div>
		조회수 : ${dto.readcount}
	</div>
	 <div>
      	제목 <input id="title" name="title" size="80" value="${dto.title}" placeholer="제목을 입력해주세요">
   </div>
   <div>
      	내용
      	<textarea name="content" id="content" rows="4" cols="80" placeholer="내용을 입력해주세요.">${dto.content}</textarea>
   </div>
   <div>
    	  이름 <input id="writer" name="writer" value="${dto.writer}" placeholder="이름을 입력해주세요">
   </div>
   <div style="width:650px; text-align: center;">
   		<input type="hidden" name="num" value="${dto.num}">
   		<button type="button" id="btnUpdate" name="btnUpdate">수정</button>
   		<button type="button" id="btnDelete">삭제</button>
   	</div>
</form>
</body>
</html>