<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>글 작성</title>
<script type="text/javascript">

	function boardValidation() {
		
		var subject = $('#subject').val();
		var context = $('#context').val();
		
		if (!subject) {
			alert("제목을 입력해주세요.");
			$('#subject').focus();
			return false;
		} else if (!context) {
			alert("내용을 입력해주세요.");
			$('#context').focus();
			return false;
		} else {
			boardWrite(subject, context);
		}
	}
	
	function boardWrite(sub, con) {
		
		$.ajax({
			
			url: "/insertPosts.do",
			type: "POST",
			data : {
				subject : sub,
				context : con
			},
			success: function(data) {
				if (data == 1) {
					alert("글 등록이 완료되었습니다.");
					location.href="/dashboard.do"
				} else {
					alert("글 등록을 실패했습니다.")
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
        <caption>게시판 글쓰기 </caption>
    	<tbody>
            <tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요." id="subject"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="30" rows="10" placeholder="내용을 입력하세요." id="context"></textarea></td>
            </tr>
            <!-- <tr>
                <th>첨부파일: </th>
                <td><input type="text" placeholder="파일을 선택하세요. " name="filename"/></td>
            </tr> -->
            <tr>
                <td colspan="2">
                    <input type="button" value="등록" onclick="boardValidation()"/>
                    <input type="button" value="뒤로" onclick="javascript:location.href='/dashboard.do'"/>
                </td>
            </tr>
    </tbody>
</table>
</form>
</body>
</html>