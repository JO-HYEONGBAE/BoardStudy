<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var num=${board.boardNum};
	var type="${board.boardType}";
	$j(function(){
		
		$j("#updateActionBtn").click(function(){
			if(confirm("수정하시겠습니까")){
				
			$j.ajax({
				url: "/board/boardUpdateAction.do",
				headers:{
					"X-HTTP-Method-Override":"PUT",
					"Content-Type":"application/json"
				},
				type:"put",
				data:JSON.stringify({
					boardType:$j("#boardType").val(),
					boardNum:$j("#boardNum").val(),
					boardTitle:$j("#boardTitle").val(),
					boardComment:$j("#boardComment").val()
				}),
				dataType:"text",
				error:function(data){
					alert("수정 오류");
					alert("메세지"+data)
				},success:function(data){
					alert("수정완료");
					
					alert("메세지:"+data);
					
					location.href="/board/"+type+"/"+num+"/boardView.do";
				}
			});
			}
		});
	});

</script>
<body>
<form class="boardUpdate">
<input type="hidden" id="boardType" name="boardType" value="${board.boardType}">
<input type="hidden" id="boardNum" name="boardNum" value="${board.boardNum}">
	<table align="center">
		<tr>
			<td align="right">
			<input id="updateActionBtn" type="button" value="수정">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" id="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment" id="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
					<c:if test="${board.creator ne 'SYSTEM'}">	
						${board.creator}
						<input type="hidden" name="creator" value="${board.creator}">
					</c:if>	
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>
