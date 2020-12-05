<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="호텔관리연습-객실관리" content="width=device-width, initial-scale=1.0">
<title>객실관리</title>
<style>
        * {margin: 0; padding: 0; list-style: none; text-decoration:none; color: black;}
        body {width: 1080px; margin: 0 auto;}
        #cent {margin-top: 100px; }
        #main {clear: both; height: 700px; border: 1px solid black;}
        #mainlist li {border: 1px solid black; float: left; padding: 25px;}
        #select {width: 45%; margin: 20px; float: left; height: 650px; overflow: auto; border: 1px solid black;} 
        #roomlist {border-collapse: collapse; }
        #roomlist tr td{ padding: 10px 25px; font-size : 14px;}
        #input1 {width: 45%; border: 1px solid black; float: right; margin: 20px; height: 650px;}
        #input1-1 {margin: 20px;}
        input[type="text"] {padding: 10px; margin-left: 15px;}
        select {margin-left: 15px;}
        #input1-1 tr td {padding: 15px 0;}
        input[type="button"] {padding: 15px; margin-top: 150px;}
        .hide {display:none}
</style>
</head>
<body>
    <div id="cent">
        <div id="tab">
            <ul id="mainlist">
                <li><a href="hotel1.jsp">객실관리</a></li>
                <li><a href="hotel2.jsp">예약관리</a></li>
            </ul>
        </div>
        <div id="main">
            <div id="select">
                <div id="roomlist">
                    <table border="1" id="roomlist1">
                        <tr>
                        	<td class="hide">객실id</td>
                            <td>객실명</td>
                            <td>객실분류</td>
                            <td>숙박가능인원</td>
                            <td>1박요금</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="input1">
                <div id="input1-1">
                    <table id="input1-1-1">
                    	<tr>
                            <td><input type="hidden" name="room_id"></td>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="crupType"></td>
                        </tr>
                        <tr>
                            <td>객실명</td>
                            <td><input type="text" id="room_name" name="room_name"></td>
                        </tr>
                        <tr>
                            <td>숙박인원</td>
                            <td><input type="text" name="how_many"></td>
                        </tr>
                        <tr>
                            <td>객실분류</td>
                            <td>
                                <select name="room_type" size="5">
                                    <option value="SweetRoom">스위트룸</option>
                                    <option value="FamilyRoom">패밀리룸</option>
                                    <option value="DoubleRoom">더블룸</option>
                                    <option value="SingleRoom">싱글룸</option>
                                    <option value="Domitory">직원기숙사</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>1박요금</td>
                            <td><input type="text" name="how_much"></td>
                        </tr>
                    </table>
                    <table>
                        <tr class="but">
                            <td><input type="button" id="confirm" value="등록(수정)">
                                <input type="button" id="delete" value="삭제">
                                <input type="button" id="clear" value="비우기">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
let ind=null;//등록된 객실정보 선택시 인덱스 알기위해 변수선언
$(document)
.ready(function(){//페이지 로드시 현재 등록된 객실정보 불러옴
	$.get('selectP1',{},function(data){
		$.each(data,function(ndx,value){
			name='<tr><td class="hide">'+value['roomid']+'</td><td>'+value['roomname']+'</td><td>'+value['roomtype']+'</td><td>'+value['howmany']+'</td><td>'+value['howmuch']+'</td></tr>';
			$('#roomlist1').append(name);
		})
	},'json')
	$('input[name=crupType]').val("cr");//등록상태로 초기화
	return false;
})

.on('click','#confirm',function(){//등록버튼 눌렀을때
	if($('input[name=room_name]').val()==""){//객실명 빈칸인 경우 유효성검사
		alert("객실명을 입력하세요");
		$('input[name=room_name]').focus();
		return false
	}
	
	
	if($('input[name=how_many]').val()==""){//숙박인원 빈칸인 경우 유효성검사
		alert("숙박인원을 입력하세요");
		$('input[name=how_many]').focus();
		return false
	}
	if(!$.isNumeric($('input[name=how_many]').val())){//숙박인원 숫자가 아닌경우 경우 유효성검사
		alert("숙박인원은 숫자만 입력 가능합니다.");
		$('input[name=how_many]').val("");
		$('input[name=how_many]').focus();
		return false
	}
	if($('select[name=room_type]').val()==null){//객실분류 미선택 경우 유효성검사
		alert("객실분류를 선택해주세요");
		return false
	}
	if($('input[name=how_much]').val()==""){//숙박요금 빈칸인 경우 유효성검사
		alert("1박비용을 입력하세요");
		$('input[name=how_much]').focus();
		return false
	}
	if(!$.isNumeric($('input[name=how_much]').val())){//숙박요금 미선택 경우 유효성검사
		alert("1박비용은 숫자만 입력 가능합니다.");
		$('input[name=how_much]').val("");
		$('input[name=how_much]').focus();
		return false
	}
	
	const result = confirm('이대로 객실정보를 등록(변경) 하시겠습니까?')
	
	if(result){//예 버튼 눌렀을때
		if($('input[name=crupType]').val()=="cr"){//예약등록
			for(i=1;i<$('#roomlist1 tr').length;i++){//객실명 중복 여부 판단()
				if($('#roomlist1 tr:eq('+i+') td:eq(1)').text()==$('input[name=room_name]').val()){
					alert('객실명이 중복되었습니다.');
					$('input[name=room_name]').focus();
					return false;
				}
			}
			$.ajax({
				url:"insertP1",
				data:{roomname:$('input[name=room_name]').val(),
					howmany:$('input[name=how_many]').val(),roomtype:$('select[name=room_type]').val(),
					howmuch:$('input[name=how_much]').val()},
				type:"get"
			}).done(function(data){//객실정보 등록 성공시
				alert("객실정보저장이 완료되었습니다.")
				location.reload();//페이지 새로고침
			}).fail(function(xhr,status,errorThrown){//객실정보 등록 실패시
				console.log(xhr,errorThrown,status)
				alert("오류가 발생하였습니다.")
				return false
			})	
		}else{//예약수정
			$.ajax({
				url:"updateP1",
				data:{roomid:$('input[name=room_id]').val(),roomname:$('input[name=room_name]').val(),
					howmany:$('input[name=how_many]').val(),roomtype:$('select[name=room_type]').val(),
					howmuch:$('input[name=how_much]').val()},
				type:"get",
				dataType:"json"
			}).done(function(data){
					alert("객실정보가 변경되었습니다.")
					location.reload();
					$('#clear').trigger('click');
					return false
				
			}).fail(function(xhr,status,errorThrown){
				console.log(xhr,errorThrown,status)
				alert("오류가 발생하였습니다.")
				return false
			})	
		}
	}else{//아니오 버튼 눌렀을때
		alert('객실정보 입력이 취소되었습니다.')
		$('#clear').trigger('click');
		return false;
	}
})

.on('click','#clear',function(){//비우기 버튼 눌렀을때 작동
	$('input[name=crupType]').val("cr");
	$('input[name=room_id]').val("");
	$('input[name=room_name]').val("");
	$('input[name=how_many]').val("");
	$('select[name=room_type]').val("");
	$('input[name=how_much]').val("");
	return false;
})

.on('click','#roomlist1 tr',function(){//객실목록칸을 클릭했을때
	ind = $(this).index();
	if(ind>0){
		$('input[name=crupType]').val("up")
		$('input[name=room_id]').val($("#roomlist1 tr:eq("+ind+") td:eq(0)").text())
		console.log($("#roomlist1 tr:eq("+ind+") td:eq(1)").text());
		$('input[name=room_name]').val($("#roomlist1 tr:eq("+ind+") td:eq(1)").text())
		$('input[name=how_many]').val($("#roomlist1 tr:eq("+ind+") td:eq(3)").text())
		$("select option[value="+$("#roomlist1 tr:eq("+ind+") td:eq(2)").text()+"]").prop("selected",true)
		$('input[name=how_much]').val($("#roomlist1 tr:eq("+ind+") td:eq(4)").text());
	}else{
		$('#clear').trigger('click');
	}

})

.on('click','#delete',function(){
	const resultD = confirm('정말 객실정보를 삭제하시겠습니까?')
	if(resultD){//삭제 예 버튼 눌렀을때
		$.get('deleteP1',{roomid:$('input[name=room_id]').val()},function(){
				alert("객실정보 삭제가 완료되었습니다.");
				location.reload();
				$('#clear').trigger('click');//비우기 버튼 누르기 발동
		})
		return false;
	}else{//삭제 아니오 버튼 눌렀을때
		alert("객실정보 삭제가 취소되었습니다.")
		return false;
	}
})

</script>
</html>