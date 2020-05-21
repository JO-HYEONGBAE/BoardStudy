<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">
		var count=1;
		var num=0;
		var chkArray=[];
		var size=0;
		var chk=1;

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			console.log("카운트"+count);
			for(var i=1;i<count;i++){
				if($j(".remove"+i).val()==""){
					if(i>=chk){
						
					$j(".remove"+i).find(".type").attr({"name":"boardVo["+chk+"].boardType"});
					$j(".remove"+i).find(".title").attr({"name":"boardVo["+chk+"].boardTitle"});
					$j(".remove"+i).find(".comment").attr({"name":"boardVo["+chk+"].boardComment"});
					$j(".remove"+i).find(".creator").attr({"name":"boardVo["+chk+"].creator"});
					console.log("인덱스"+i);
					chk=chk+1;
					}
				}
			}
			
			
		    var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			console.log(param);
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});  
		});
	
		
		$j(document).on("click",'.chkBox',function(){
			if($j(this).prop("checked")){
				
			num=$j(this).attr("data-num");
			num=Number(num);
			chkArray.push(num);
			console.log(num);
			}
			else{
				
			chkArray.splice(chkArray.indexOf($j(this).val()),1);
				
			}
		});
		
		
		$j("#add").click(function(){
			addItem(count);
			count=count+1;
			size=$j(".chkBox").size();
		});
		
		$j("#delete").click(function(){
			delItem(chkArray);
			size=$j(".chkBox").size();
				
		});
	});		
	
	
	 function addItem(cnt){
		 
		var trType=$j("<tr>");
		trType.addClass("remove"+cnt);
		var trTitle=$j("<tr>");
		trTitle.addClass("remove"+cnt);
		var trComment=$j("<tr>");
		trComment.addClass("remove"+cnt);
		
		
		var tdType=$j("<td>");
		tdType.attr({"width":"120","align":"center"});
		tdType.html("Type");
		
		var tdType2=$j("<td>");
		var select=$j("<select>");
		//select.attr({"name":"boardVo["+cnt+"].boardType"});
		select.addClass("type");
	<c:forEach items="${type}" var="i">
		var option=$j("<option>");
		option.val("${i.codeId}");	
		option.html("${i.codeName}");
		select.append(option);
	</c:forEach>
		
		var tdTitle =$j("<td>");
		tdTitle.attr({"width":"120","align":"center"});
		tdTitle.html("Title");
		
		var tdTitle2 =$j("<td>");
		var inputTitle = $j("<input>");
		inputTitle.attr({"type":"text","size":"50","maxlength":"25"});
		inputTitle.addClass("title")
		//"name":"boardVo["+cnt+"].boardTitle"
		
		
		var tdComment =$j("<td>");
		tdComment.attr({"width":"120","align":"center"});
		tdComment.html("Comment<br/>");
		
		var check= $j("<input>");
		check.attr({"type":"checkbox","data-num":cnt});
		check.addClass("chkBox");
		
		var tdComment2 =$j("<td>");
		var textArea = $j("<textarea>");
		textArea.attr({"rows":"20","cols":"55"});
		textArea.addClass("comment");
		//"name":"boardVo["+cnt+"].boardComment"
		
		var creator=$j("<input>");
 	   	creator.attr({"type":"hidden"});
 	   	creator.val($j("#creator").val());
 	   	creator.addClass("creator");
		//"name":"boardVo["+cnt+"].creator"
		
		tdComment.append(check);
	
		tdType2.append(select);
		tdTitle2.append(inputTitle);
		tdComment2.append(textArea).append(creator);
		
		
		trType.append(tdType).append(tdType2);
		trTitle.append(tdTitle).append(tdTitle2);
		trComment.append(tdComment).append(tdComment2);
		
		$j(".add").before(trType);
		trType.after(trTitle);
		trTitle.after(trComment);
		
		
		
	} 
	 
	 function delItem(s){
		 for(var i =0;i<s.length;i++){
			 
		 $j(".remove"+s[i]).remove();
		 }
	 }

</script>
<body>
<form class="boardWrite">
	<table align="center">
		<tr>
			<td align="right">
			<input id="add" type="button" value="추가">
			<input id="delete" type="button" value="삭제">
			<input id="submit" type="button" value="작성">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1" id="table"> 
					<tr>
						<td width="120" align=center>
						Type
						</td>
						<td>
						<select name="boardVo[0].boardType">
							<c:forEach items="${type}" var="i">
								<option value="${i.codeId}">${i.codeName}</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardVo[0].boardTitle" type="text" size="50"  maxlength="25"> 
						</td>
					</tr>
					<tr >
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardVo[0].boardComment"  rows="20" cols="55"></textarea>
						<input type="hidden" id="creator"name="boardVo[0].creator" value="${cookie.id.value}">
						</td>
					</tr>
					<tr class="add">
						<td align="center">
						Writer
						</td>
						<td >
						${cookie.id.value}
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
