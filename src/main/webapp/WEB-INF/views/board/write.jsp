<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>게시글 작성</title>
<script>
	$(document).ready(function(){
		$("#btnSave").click(function(){	
			var title=$("#title").val();
			var content=$("#content").val();
			var writer=$("#writer").val();
			if(title ==""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
				}
			if(content ==""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
				}
			if(writer ==""){
				alert("이름을 입력하세요");
				document.form1.name.focus();
				return;
				}
			document.form1.submit();
			
			});
	});
</script>
</head>
<body>
<h2>게시글 작성</h2>
<form name="form1" method="post" action="insert.do">
	<div>
		제목
		<input type="text" id="title" name ="title" size="100" placeholder="제목을 입력하세요">
	</div>
	<div>
		내용
		<textarea id="content" name="content" rows="4" cols="80" placeholder="내용을 입력하세요"></textarea>
	</div>
	<div>
		이름
		<input type="text" id="writer" name="writer" placeholder="이름을 입력해주세요">
	</div>
	<div style="width:650px; text-align: center;">
		<button type="button" id="btnSave" name="btnSave">확인</button>
		<button type="reset">취소</button>
	</div>
</form>
</body>
</html>