<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>Waiting Page</title>
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>	
</head>
<script type="text/javascript">
	function checkAddWaiting() {
		var regExpName = /^[a-zA-Z가-힣]*$/;
		var regExpNum = /^[0-9]*$/;
		var form = document.addWaiting;
		
		var name = form.name.value;
		var phoneNumber = form.phoneNumber.value;
		
		if(!regExpName.test(name)){ //공백값도 막자
			alert("이름 다시 입력해주세요!");
			form.name.select();
			form.name.focus();
			return;
		}		else if(!regExpNum.test(phoneNumber)){ // 공백값도 막자
			alert("전화번호는 숫자만 입력해주세요!")
			return;
		}
		else{
			alert('대기자 등록이 완료 되었습니다!');
			form.submit();
		}
		
	}
</script>
 <body>
<%@ include file="./menu.jsp" %>
	<% String greeting = "6조 대기 관리 시스템"; 
	String tagline = "대기 등록";%>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><%= greeting %>
			</h1>
		</div>
	</div>
	<div class = "text-center">
		<h3>
			<%= tagline %>
		</h3>
	</div>
	<%@ include file="./connection.jsp" %>
	<div class="container">
		<br>
		<div class="row" align="center">
			<div class="col-md-7">
				<form name="addWaiting" action="./WaitingList.jsp"
					class="form-horizontal" method="post">
					<div class="form-group row">
						<label class="col-sm-3">이름</label>
						<div class="col-sm-3">
							<input type="text" id="name"
							name="name" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">전화번호</label>
						<div class="col-sm-3">
							<input type="text" id="phoneNumber"
							name="phoneNumber" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="button" class="btn btn-primary" value="등록" onclick="checkAddWaiting()">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>		
		<%
		if(conn != null);
		conn.close();
		%>
</body>
</html>