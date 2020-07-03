<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/jstlHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>글 내용</title>
<style>
	table {
		width: 100%;
		border: 1px solid #444444;
	}
	th, td {
		border: 1px solid #444444;
	}
</style>
<script type="text/javascript">

	var id = ${result.id};
	
	function boardUpdate() {
		
		var subject = $('#subject').val();
		var context = $('#context').val();
		
		$.ajax({
			
			url: "/updatePosts.do",
			type: "POST",
			data : {
				id : id,
				subject : subject,
				context : context
			},
			success: function(data) {
				if (data == 1) {
					alert("글 수정이 완료되었습니다.");
					location.href="/dashboard.do"
				} else {
					alert("글 수정을 실패했습니다.")
				}
			}, error: function() {
				console.log("error");
			}
		})
		
	}
	
	function boardDelete() {		
		
		$.ajax({
			
			url: "/deletePosts.do",
			type: "POST",
			data : {
				id : id
			},
			success: function(data) {
				if (data == 1) {
					alert("글 삭제가 완료되었습니다.");
					location.href="/dashboard.do"
				} else {
					alert("글 삭제를 실패했습니다.")
				}
			}, error: function() {
				console.log("error");
			}
		})
	}
</script>
</head>
<body>
	<form>
		<table>
			<caption>게시판 글 내용 </caption>
		    <tbody>		    
		    	<tr>
		        	<th>제목: </th>
		            <td>
		            	<input type="text" id="subject" value="${result.subject}" style="width:100%;"> 
		            </td>
		        </tr>
		        <tr>
		            <th>내용: </th>
		            <td>
		            	<textarea id="context" style="width:100%;">${result.context}</textarea>
		            </td>
		        </tr>
		        <tr>
		            <th>조회수: </th>
		            <td>${result.views}</td>
		        </tr>
		        <tr>
		            <th>좋아요: </th>
		            <td>${result.likes}</td>
		        </tr>
		        
		        <tr>
		            <td colspan="2">
		                <input type="button" value="수정" onclick="boardUpdate()"/>
		                <input type="button" value="삭제" onclick="boardDelete()"/>
		                <input type="button" value="목록보기" onclick="javascript:location.href='/dashboard.do'"/>
		            </td>
		        </tr>
		    </tbody>
		</table>
	</form>
</body>
</html>