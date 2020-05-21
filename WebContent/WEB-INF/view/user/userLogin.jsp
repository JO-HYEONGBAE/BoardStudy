<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
			$j(function(){
				
					$j("#loginBtn").click(function(){
						if(!chkData("#userId","아이디를")) return;
						else if(!chkData("#userPw",'비밀번호를')) return;
							$j.ajax({
							url:"/user/idPwChk.do",
							type:"post",
							data:$j("#l_Form").serialize(),
							dataType:"text",
							error:function(){
								alert("잠시 후 다시 로그인해주세요.");
							},
							success:function(data){
								if(data=="Y"){
									alert("로그인을 성공하셨습니다. 게시판으로 이동합니다.");
									location.href="/board/boardList.do";
								}
								else{
									alert("아이디 및 비밀번호가 일치하지않습니다.");
								}
							}
							
						});
						
					});
				
			});
			
			function chkData(data,msg){
				if($j(data).val().replace(/s/g,"")==""){
					alert(msg+" 입력해주세요.");
					$j(data).focus();
					return false;
				}else return true;
			}
</script>
</head>
<body>
	<table align="center">
		<tr>
			<td>
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
		<tr>
			<td>
				<form id="l_Form">
				<table border="1">
					<tr>
						<td width=200 align=center>
							id
						</td>
						<td width=350>
							<input type="text" name="userId" id="userId">
						</td>
					</tr>
					<tr>
						<td width=200 align=center>
							pw
						</td>
						<td width=350>
						<input type="password" id="userPw" name="userPw" maxlength="12">
					</tr>
				</table>
				</form>
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type="button" id="loginBtn" value="login">
			</td>
		</tr>
	</table>	
</body>
</html>
