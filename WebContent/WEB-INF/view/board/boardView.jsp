<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">
	$j(function(){
		$j("#updateBtn").click(function(){
				
			$j("#AllRoundForm").attr({
				"method":"get",
				"action":"/board/boardUpdate.do"
			});
			$j("#AllRoundForm").submit();
			
		});
		$j("#deleteBtn").click(function(){
			console.log(JSON.stringify({
				boardType:$j("#boardType").val(),
				boardNum:$j("#boardNum").val()
			}));
			if(confirm("삭제하시겠습니까?")){
				$j.ajax({
					url:"/board/boardDelete.do",
					headers:{
						"X-HTTP-Method-Override":"DELETE",
						"Content-Type":"application/json"
					},
					type:"delete",
					data:JSON.stringify({
						boardType:$j("#boardType").val(),
						boardNum:$j("#boardNum").val()
					}),
					dataType:"text",
					error:function(){
						alert("삭제실패");
					},
					success:function(data){
						alert("삭제성공");
						alert("메시지"+data);
						
						location.href="/board/boardList.do";
					}
				
				
				});
				}
			
		});
		
	});
</script>
<body>
<form id="AllRoundForm">
<input type="hidden" id="boardType" name="boardType" value="${board.boardType}">
<input type="hidden" id="boardNum" name="boardNum" value="${board.boardNum}">
</form>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
				<c:if test="${board.creator ne 'SYSTEM'}">
						${board.creator }
				</c:if>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
			<input type="button" id="updateBtn" value="수정">
			<input type="button" id="deleteBtn" value="삭제">
		</td>
	</tr>
</table>	
</body>
</html>
