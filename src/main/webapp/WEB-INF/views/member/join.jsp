<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Join </title>
</head>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('../resources/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" id="joinForm" method="post" action="${contextPath }/member/join">
					<span class="login100-form-title p-b-34 p-t-27">
						J O I N
					</span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="member_id" placeholder="ID">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="password" name="member_pw" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="member_name" placeholder="Name">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="member_email" placeholder="Doe@uth.com">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="joinbtn" onclick="javascript:clickBtn();">
							회원가입
						</button>
					</div>
					<div class="text-center p-t-90">
						<a class="txt1" href="#">
							홈으로
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
<!-- 자바스크립트  -->
	<script type="text/javascript">
		function clickBtn(){
			document.getElementById("joinForm").submit();
		}
	</script>	
<!--===============================================================================================-->
	<script src="../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="../resources/vendor/animsition/js/animsition.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../resources/vendor/select2/select2.min.js"></script>
	<script src="../resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="../resources/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="../resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../resources/js/main.js"></script>

</body>
</html>