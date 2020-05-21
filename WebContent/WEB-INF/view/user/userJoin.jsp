<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	
			$j(function(){
				var idExp=/^[a-zA-Z0-9+]*$/;
				var pwExp=/^([a-zA-Z0-9]){6,12}$/;
				var regExp=/\d{4}/;
				var postExp=/^\d{3}-{1}\d{3}$/;
				var nameExp=/^[ㄱ-ㅎㅏ-ㅣ+가-히]*$/;
				var cnt=0;
				var pwCnt=0;
				var nameCnt=0;
				var phone2Cnt=0;
				var phone3Cnt=0;
				var postCnt=1;
				var chk=0;
				$j("#chkId").click(function(){
					var id=$j("#userId").val();
					if(!chkData("#userId","아이디를")) return;
					else{
						$j.ajax({
							url:"/user/idCheck.do?userId="+$j("#userId").val(),
							dataType:"text",
							type:"get",
							error:function(){
								alert("잠시후 다시 시도해주세요.");
							},
							success:function(data){
								if(data=="Y"){
									alert("사용 가능한 아이디입니다.");
									$j("#userId").prop("disabled",true);
									$j("#chkId").prop("disabled",true);
									cnt=1;
								}
								else{
									alert("이미 사용중인 아이디입니다.");
									cnt=0;
								}
							}
						});
					}
					
				});
				
				$j("#userId").keyup(function(){
					var $id=$j(this).val();
					$id=$id.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-히]/g,"");
					
					$j("#userId").val($id);
					
				});
				
				$j("#userPw").keyup(function(){
					var pw=$j("#userPw").val().length;
					if(pw<6){
						chkExp("#userPw","#msg","6자리부터 12자리로 설정해주세요.");
						pwCnt=0;
					}
						
					else if($j("#userPw").val()==$j("#userPwCheck").val()){
						$j("#msg").css("color","green");
						$j("#msg").html("비밀번호가 일치합니다.");
						pwCnt=1;
						
					
					}
				
					
					else{
						chkExp("#userPw","#msg","비밀번호가 일치하지않습니다.");
						pwCnt=0;
					}
				});
				
				$j("#userName").change(function(){
					var name=$j("#userName").val();
					if(!nameExp.test(name)){
						/* alert("이름은 한글만 사용가능합니다."); */
						nameCnt=0;
					}else
					nameCnt=1;
				});
				
				$j("#userName").keyup(function(){
					var $name=$j(this).val();
					$name=$name.replace(/[a-zA-Z0-9]/g,"");
					
					$j("#userName").val($name);
					
				});
				
				$j("#userPwCheck").keyup(function(){
					if($j("#userPw").val()==$j("#userPwCheck").val()){
						
						$j("#msg").css("color","green");
						$j("#msg").html("비밀번호가 일치합니다.");
						pwCnt=1;
					if($j("#userPwCheck").val().length<6){
						
						chkExp("#userPwCheck","#msg","6자리부터 12자리로 설정해주세요.");
						pwCnt=0;
					}
					}else{
						chkExp("#userPwCheck","#msg","비밀번호가 일치하지않습니다.");
						pwCnt=0;
						console.log(pwCnt);
					}
				});
				
				
				
				$j("#userPhone2").change(function(){
					var ph2=$j("#userPhone2").val();
					var regExp=/\d{4}/;
					if(!regExp.test(ph2)){
						chkExp("#userPhone2","#pMsg","두번째 전화번호는 숫자 4자리입니다.");
						phone2Cnt=0;
						
					}else{
						$j("#pMsg").html("");
						phone2Cnt=1;
						}
					});
				
					$j("#userPhone3").change(function(){
						var ph3=$j("#userPhone3").val();
						
						if(!regExp.test(ph3)){
							chkExp("#userPhone3","#pMsg","세번째 전화번호는 숫자 4자리입니다.");
							phone3Cnt=0;
						}else{
							$j("#pMsg").html("");
							phone3Cnt=1;
						}	
					
					});
					
					
					$j("#userAddr1").change(function(){
						var post=$j("#userAddr1").val();
						if(post.length==0){
							postCnt=1;
							chk=1;
						}else if(!postExp.test(post)){
							$j("#userAddr1").focus();
							alert("xxx-xxx형식으로 입력해주세요.");
							postCnt=0;
						}
						else
							postCnt=1;
					});
					$j("#userAddr1").keyup(function(e){
						var $addr=$j(this).val();
						var addrExp=/\d{4,}/;
						$addr=$addr.replace(/[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅑ|가-히|]/g,"");
						
						$j("#userAddr1").val($addr);
						
						if(addrExp.test($addr)){
							var n=$addr.substring(0,3);
							var i=$addr.substring(3);
							$addr=n+"-"+i;
							$j("#userAddr1").val($addr);
							console.log($addr);
							chk=1;
						}
						
						if($addr.length==3 && chk==0){
							$j("#userAddr1").val($addr+"-");
							chk=1;
						}else if($addr.length==2 && chk==1){
							chk=0;
						}else if($addr.length==3 && chk==1 ){
							var n=$addr.substring(0,2);
							$j("#userAddr1").val(n);
							chk=0;
							console.log(n);
						}else if($addr.length>=4 && chk==1){
							chk==1;
						}
						
					});
					
					$j("#joinBtn").click(function(){
						if(!chkData("#userId","아이디를")) return;
						else if(!chkForm(cnt,"#userId","아이디 중복")) return;
						else if(!chkData("#userPw","비밀번호를")) return;
						else if(!chkData("#userPwCheck","비밀번호 확인을"))return;
						else if(!chkForm(pwCnt,"#userPw","비밀번호를"))return;
						else if(!chkData("#userName","이름을"))return;
						else if(!chkForm(nameCnt,"#userName","이름을"))return;
						else if(!chkData("#userPhone2","2번째 전화번호를"))return;
						else if(!chkForm(phone2Cnt,"#userPhone2","2번째 전화번호를"))return;
						else if(!chkData("#userPhone3","3번째 전화번호를"))return;
						else if(!chkForm(phone3Cnt,"#userPhone3","3번째 전화번호를"))return;
						else if(!chkForm(postCnt,"#userAddr1","우편번호를"))return;
						else{
							if(confirm("회원가입하시겠습니까?")){
								$j("#userId").prop("disabled",false);
								$j.ajax({
									url:"/user/userJoinAction.do",
									type:"post",
									data:$j("#j_Form").serialize(),
									dataType:"text",
									error:function(){
										alert("회원가입에 실패하였습니다. 잠시 후 다시 이용해주세요.");
										$j("#userId").prop("disabled",false);
										$j("#chkId").prop("disabled",false);
									},
									success:function(data){
										if(data=="Y"){
											alert("회원가입에 성공하셨습니다. 게시판으로 이동합니다.");
											location.href="/board/boardList.do";
										}
										
									}
									
								});
								
							} 
						}
					});
				
			});	
			function chkData(data,msg){
				if($j(data).val().replace(/s/g,"")==""){
					alert(msg+" 입력해주세요.");
					$j(data).focus();
					return false;
				}else return true;
			}
			
			function chkExp(data,msg,text){
				$j(data).focus();
				$j(msg).css("color","red");
				$j(msg).html(text);
			}
			
			function chkForm(cnt,id,msg){
				if(cnt!=1){
					
				alert(msg+" 확인해주세요.");
				$j(id).focus();
				return false;
				}else return true;
			}
			
</script>
<body>
	<table align=center>
		<tr>
			<td>
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
		<tr>
			<td>
				<form id="j_Form">
				<table border="1">
					<tr>
						<td width=200 align=center>
							id
						</td>
						<td width=500>
							<input type="text" name="userId" id="userId" maxlength="14">
							<input type="button" id="chkId" value="중복확인">
						</td>
					</tr>
					<tr>
						<td width=200 align=center>
							pw
						</td>
						<td >
						<input type="password" id="userPw" name="userPw" maxlength="12">
					</tr>
					<tr>
						<td width=200 align=center>
							pw check
						</td>
						<td width=350>
						<input type="password" id="userPwCheck" maxlength="12">
						<span id="msg" style="font-size: 10px"></span>
						</td>
					</tr>
					<tr>
						<td width=200 align=center>
							name
						</td>
						<td width=350>
						<input type="text" id="userName" name="userName" maxlength="6">
					</tr>
					<tr>
						<td width=200 align=center>
							phone
						</td>
						<td width=350>
							<select name=userPhone1>
								<c:forEach items="${type}" var="i">
									<option value="${i.codeId}">${i.codeName}</option>
								</c:forEach>
							</select>
							-
							<input type=text id="userPhone2" name=userPhone2 style="width: 50px" maxlength="4">
							-
							<input type="text" id="userPhone3" name=userPhone3 style="width: 50px" maxlength="4">
							
							<span id="pMsg" style="font-size: 10px"></span>
						</td>
					</tr>
					<tr>
						<td width=200 align=center>
							postNo
						</td>
						<td width=350>
						<input type="text" id="userAddr1" name="userAddr1" maxlength="7">
					</tr>
						<tr>
						<td width=200 align=center>
							address
						</td>
						<td width=350>
						<input type="text" id="userAddr2" name="userAddr2" maxlength=25>
					</tr>
					<tr>
						<td width=200 align=center>
							company
						</td>
						<td width=350>
						<input type="text" id="userCompany" name="userCompany" maxlength=50>
					</tr>	
				</table>
				</form>
				<tr>
					<td align="right">
						<input type="button" id="joinBtn" value="Join">
					</td>
				</tr>
	</table>
</body>
</html>
