<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">
var n;
var chkArray=[];
var cnt=0;
var le="${type}";
	$j(document).ready(function(){
		console.log(le.size);
	<c:forEach items="${type}" var="i" varStatus="cnt">
		n="${data.keyword[cnt.index]}";
		console.log(n);
		cnt++;
		if(n!=""){
			$j("input:checkbox[name='keyword']:checkbox[value='"+n+"']").prop("checked",true);
			chkArray.push(n);
			console.log(chkArray);
		}
	
	</c:forEach>
		if(chkArray.length==cnt){
			$j("#chkAll").prop("checked",true);
		}
	console.log(cnt);
		$j("#chkAll").click(function(){
			 
			if($j("#chkAll").prop("checked")){
				$j("input[name='keyword']").prop("checked",true);
				 $j("input[name='keyword']:checked").each(function(i){
					
					chkArray.push($j(this).val());
				 });
				
			}
			else {
				$j("input[name='keyword']").prop("checked",false);
				chkArray=[];
			}
			 console.log(chkArray.length);
			
		});
		
		 $j(".chks").on('click',function(){
				if($j(this).prop("checked")){
					chkArray.push($j(this).val());	
					console.log(chkArray);
					
						
				}
				else{
					chkArray.splice(chkArray.indexOf($j(this).val()),1);
					console.log(1);
					console.log(chkArray);
				}
				if(chkArray.length==cnt && !$j("#chkAll").prop("checked")){
					$j("#chkAll").prop("checked",true);
					
				}else if(chkArray.length!=cnt) {
					
					$j("#chkAll").prop("checked",false);
				}
		 });
		$j("#searchBtn").click(function(){
			console.log($j("input[name='keyword']").val());
			$j("#s_form").attr({
				"action":"/board/boardList.do",
				"method":"get"
			});
			$j("#s_form").submit();
			});
		
		
		
	});
</script>
<body>
<table  align="center">
	<tr>
		<td align="left">
			<a href="/board/boardLogin.do">Login</a>
			<a href="/board/boardJoin.do">Join</a>
		</td>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr data-type="${list.boardType }">
						<td align="center">
							${list.com_CodeVo.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<tr>
		<td align=left>
		<form id="s_form">
		<input type="checkbox" id="chkAll"  value="1">전체
		<c:forEach items="${type }" var="i">
			<input type="checkbox" name=keyword class="chks" value="${i.codeId}">${i.codeName}
		</c:forEach>
		<!-- <input type="checkbox" name="keyword" value="a01">일반
		<input type="checkbox" name="keyword" value="a02">Q&A
		<input type="checkbox" name="keyword" value="a03">익명
		<input type="checkbox" name="keyword" value="a04">자유 -->
		</form>
		<input type="button" id="searchBtn" value="조회">
		</td>
	</tr>
</table>	
</body>
</html>
