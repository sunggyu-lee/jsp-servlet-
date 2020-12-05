<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
 <style>
        * {margin: 0; padding: 0; list-style: none; text-decoration:none; color: black;}
        body {width: 1200px; margin: 0 auto;}
        #cent {margin-top: 100px; }
        #mainlist li {border: 1px solid black; float: left; padding: 25px;}
        #main {clear: both; height: 700px; border: 1px solid black;}
        #select {width: 28%; float: left; }
        #search1 {margin: 20px;}
        #search1 input[type="button"] {padding: 5px; }
        #search1 span {display:block; margin: 15px 0;}
        #search1 p {margin: 15px 0;}
        #roomlist {height:350px; margin: 20px; overflow: auto;}
        #roomlist p {margin: 10px 0;}
        #roomlist table tr td {padding: 8px; font-size: 13px;}
        #searchlist {width: 20%; float: left;}
        #searchlist span {display:block; margin: 15px 0;}
        #comp_sec {width: 50%; float: right; overflow: auto;}
        #comp_sec p {margin: 15px 0;}
        #confirm tr td {font-size: 13px; padding: 10px;}
        input[type="text"] {padding: 10px; margin-left: 15px; width: 100px;}
        input[type="date"] {margin-left: 15px; width: 125px; height: 25px}
        #buttonclass input[type="button"] {padding: 5px; margin: 30px 5px 0 0;}
        .hide {display:none;}
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
                <div id="search1">
                    <span>숙박조건 검색</span>
                    <p>체크인 날짜</p>
                    <input type="date" name="checkin1">
                    <p>체크아웃 날짜</p>
                    <input type="date" name="checkout1">
                    <p>객실종류</p>
                    <select name="room_type">
                        <option value="SweetRoom">스위트룸</option>
                        <option value="FamilyRoom">패밀리룸</option>
                        <option value="DoubleRoom">더블룸</option>
                        <option value="SingleRoom">싱글룸</option>
                   
                    </select>
                    <input type="button" name="sec" value="조회">
                </div>
                <div id="roomlist">
                    <p id="sec1">예약 가능한 객실</p>
                    <table id="roomlist1" border="1">
                        <tr>
                        	<td>객실id</td>
                            <td>객실명</td>
                            <td class="hide">객실종류</td>
                            <td>숙박가능인원</td>
                            <td>1박요금</td>
                        </tr>
                    </table>
                </div>
        </div>
        <div id="searchlist">
            <span>예약등록</span>
            <table id="searchlist1">
                <tr>
                    <td><input type="hidden" name="crup"></td>
                </tr>
                <tr>
                    <td>객실명</td>
                    <td><input type="text" name="room_name"></td>
                </tr>
                <tr>
                    <td>체크인 날짜</td>
                    <td> <input type="date" name="checkin2"></td>
                </tr>
                <tr>
                    <td>체크아웃 날짜</td>
                    <td><input type="date" name="checkout2"></td>
                </tr>
                <tr>
                    <td>숙박인원</td>
                    <td><input type="text" name="how_many"></td>
                </tr>
                <tr>
                    <td>대표자이름</td>
                    <td><input type="text" name="cs_name"></td>
                </tr>
                <tr>
                    <td>연락 가능한 번호</td>
                    <td><input type="text" name="cs_mobile"></td>
                </tr>
                <tr>
                    <td>총 숙박비용</td>
                    <td><input type="text" name="check_sum"></td>
                </tr>
                <tr>
                    <td>예약 id</td>
                    <td><input type="text" name="confim_id"></td>
                </tr>
                <tr>
                    <td>객실분류</td>
                     <td><input type="text" name="room_type"></td>
                </tr>
                <tr>
                    <td>객실ID</td>
                    <td><input type="text" name="room_id"></td>
                </tr>
                <tr>
                    <td>1박요금</td>
                    <td><input type="text" name="cus_oneday"></td>
                </tr>
                <tr>
                    <td>최대숙박인원</td>
                    <td><input type="text" name="cus_max"></td>
                </tr>
            </table>
            <table id="buttonclass">
                <tr>
                    <td><input type="button" name="confirm" value="예약확정(변경)"></td>
                    <td><input type="button" name="cancel" value="예약취소"></td>
                    <td><input type="button" name="delete" value="비우기"></td>
                </tr>
            </table>
        </div>
        <div id="comp_sec">
            <p>예약확정된 객실목록</p>
            <table id="confirm" border="1">
                <tr>
                	<td>예약ID</td>
                	<td>객실ID</td>
                    <td>객실명</td>
                    <td>객실분류</td>
                    <td>체크인</td>
                    <td>체크아웃</td>
                    <td>대표자</td>
                    <td>전화번호</td>
                    <td>인원</td>
                    <td class="hide">숙박비용</td>
                    <td class="hide">1박요금</td>
                    <td class="hide">최대숙박인원</td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script  type="text/javascript">
//오늘날짜 저장하는법
var date = new Date();
var yyyy = date.getFullYear();
var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
var today=yyyy+"-"+mm+"-"+dd;
let ind=null; //예약 가능방 선택한 인덱스 저장용
let ind2=null; //예약 확정방 선택한 인덱스 저장용
let maxC=null; //최대 숙박인원 계산용
$(document)
.ready(function(){//페이지 로딩시 
    $("input[name=room_name]").attr("readonly",true);
    $("input[name=check_sum]").attr("readonly",true);
    $("input[name=confim_id]").attr("readonly",true);
    $("input[name=room_type]").attr("readonly",true);
    $("input[name=room_id]").attr("readonly",true);
    $("input[name=cus_oneday]").attr("readonly",true);
    $("input[name=cus_max]").attr("readonly",true);
    $("input[name=checkin1]").val(today);
    $("input[name=checkout1]").val(today);
    $("input[name=checkin2]").prop("disabled", true); //비활성화
    $("input[name=checkout2]").prop("disabled", true);
    $("input[name=crup]").val("cr");
    $.get('selectP21',{},
            function(data){
               $.each(data,function(ndx,value){
            	   name='<tr><td>'+value['resid']+'</td><td>'+value['roomid']+
                   '</td><td>'+value['roomname']+'</td><td>'+value['roomtype']+
                   '</td><td>'+value['checkindate']+'</td><td>'+value['checkoutdate']+
                   '</td><td>'+value['cusname']+'</td><td>'+value['cusnumber']+
                   '</td><td>'+value['howmany']+'</td><td class="hide">'+value['cussum']+
                   '</td><td class="hide">'+value['cusoneday']+'</td><td class="hide">'+value['cusmax']+'</td></tr>';
           			$('#confirm').append(name);
            	})
      },'json')
      return false;
})

.on('change',"input[name=checkin1]",function(){
    if( $("input[name=checkin1]").val()<today){//오늘 이전에 조회하려는 경우 유효성 검사
       alert("오늘 이전엔 체크인 할 수 없습니다.")
       $("input[name=checkin1]").val(today);
       return false;
    }
})

.on('change',"input[name=checkout1]",function(){
    if( $("input[name=checkout1]").val()<today){//오늘 이전에 체크아웃 날짜 체크한 경우
    	alert("오늘 이전엔 체크아웃 할 수 없습니다.")
       $("input[name=checkout1]").val(today);
       return false;
    }
})

.on('change',"input[name=checkin2]",function(){
    if( $("input[name=checkin2]").val()<today){//오늘 이전에 예약하려는 경우 유효성 검사
       alert("오늘 이전엔 체크인 할 수 없습니다.")
       $("input[name=checkin2]").val(today);
       return false;
    }
})

.on('change',"input[name=checkout2]",function(){
    if( $("input[name=checkout2]").val()<today){//오늘 이전에 체크아웃 날짜 체크한 경우
       alert("오늘 이전엔 체크아웃 할 수 없습니다.")
       $("input[name=checkout2]").val(today);
       return false;
    }
})


.on('change',"input[name=checkout2]",function(){
    if( $("input[name=checkin2]").val()>$("input[name=checkout2]").val()){//예약 체크아웃 날짜가 체크인 날짜보다 적은경우
       alert("체크아웃 날짜가 체크인 날짜보다 빠를 수 없습니다.")
       $("input[name=checkout2]").val($("input[name=checkin2]").val());
       return false;
    }
})

.on('change',"input[name=checkin2]",function(){
    if( $("input[name=checkout2]").val()<$("input[name=checkin2]").val()){//조회 체크인 날짜가 체크아웃 날짜보다 적은경우
       alert("체크인 날짜가 체크아웃 날짜보다 늦을 수 없습니다.")
       $("input[name=checkout2]").val($("input[name=checkin2]").val());
       return false;
    }
})

.on('change',"input[name=checkin2]",function(){
	if( $("input[name=checkout2]").val()==$("input[name=checkin2]").val()){//당일예약 조회하려는 경우
	       alert("당일예약은 불가능합니다.")
	       return false;
	    }
})

.on('change',"input[name=how_many]", function(){//숙박인원수가 최대숙박가능인원수 보다 많을 때 유효성 체크
	if($("input[name=how_many]").val()>maxC){
		alert("숙박인원수가 최대숙박가능인원보다 많습니다. 숙박인원을 다시 입력하세요")
		$("input[name=how_many]").val("")
		$("input[name=how_many]").focus()
		return false;
	}else{
		let tt = Number($('input[name=cus_oneday]').val());
		let ta = Number($('input[name=how_many]').val());
		let ti = $('input[name=checkin2]').val();
		let ti1 = ti.split('-');
		let tid = new Date(ti1[0],ti1[1],ti1[2]);
		let to = $('input[name=checkout2]').val();
		let to1 = to.split('-');
		let tod = new Date(to1[0],to1[1],to1[2]);
		let ts = tod-tid;
		let cDay = 24*60*60*1000;
		let tss = parseInt(ts/cDay);
		$('input[name=check_sum]').val(tt*ta*tss);
		return false
	}
})

.on('click','input[name=sec]',function(){//조회 클릭시
	$('input[name=delete]').trigger('click');
	    if( $("input[name=checkin1]").val()>$("input[name=checkout1]").val()){//조회 체크아웃 날짜가 체크인 날짜보다 적은경우
	       alert("체크아웃 날짜가 체크인 날짜보다 빠를 수 없습니다.")
	       $("input[name=checkout1]").val($("input[name=checkin1]").val());
	       return false;
	    }
	    if( $("input[name=checkout1]").val()<$("input[name=checkin1]").val()){//예약 체크인 날짜가 체크아웃 날짜보다 적은경우
	       alert("체크인 날짜가 체크아웃 날짜보다 늦을 수 없습니다.")
	       $("input[name=checkout1]").val($("input[name=checkin1]").val());
	       return false;
	    }
	    if( $("input[name=checkout1]").val()==$("input[name=checkin1]").val()){//당일예약 조회하려는 경우
		       alert("당일예약은 불가능합니다.")
		       return false;
		    }
    $('#roomlist1 tr').remove();
    $('#roomlist1').append('<tr><td>객실id</td><td>객실명</td><td class="hide">객실종류</td><td>숙박가능인원</td><td>1박요금</td></tr>');
    $.get('selectP2',
            {checkin1:$('input[name=checkin1]').val(),checkout1:$('input[name=checkout1]').val(),roomtype:$('select[name=room_type]').val()},
            function(data){
               $.each(data,function(ndx,value){
               name='<tr><td>'+value['roomid']+'</td><td>'+value['roomname']+'</td><td class="hide">'+value['roomtype']+'</td><td>'+value['howmany']+'</td><td>'+value['howmuch']+'</td></tr>';
            $('#roomlist1').append(name);
            })
      },'json');
    return false;
})

.on('click','#roomlist1 tr',function(){//예약가능한 방목록칸을 클릭했을때
   ind = $(this).index();
   if(ind>0){
		$('input[name=delete]').trigger('click');
		$("input[name=checkin2]").prop("disabled", false); //비활성화
		$("input[name=checkout2]").prop("disabled", false);
	   $('input[name=crup]').val("cr")
	   console.log( $('input[name=crup]').val())
	   $('input[name=room_id]').val($("#roomlist1 tr:eq("+ind+") td:eq(0)").text());
	   $('input[name=room_name]').val($("#roomlist1 tr:eq("+ind+") td:eq(1)").text());
	   $('input[name=room_type]').val($("#roomlist1 tr:eq("+ind+") td:eq(2)").text());
	   $('input[name=cus_max]').val($("#roomlist1 tr:eq("+ind+") td:eq(3)").text());
	   $('input[name=cus_oneday]').val($("#roomlist1 tr:eq("+ind+") td:eq(4)").text());
	   $('input[name=checkin2]').val($('input[name=checkin1]').val());
	   $('input[name=checkout2]').val($('input[name=checkout1]').val());
	   maxC= $('input[name=cus_max]').val()
	   return false;
   }else{
	   $('input[name=delete]').trigger('click');
   }
})

.on('click','#confirm tr',function(){//예약확정한 방목록칸을 클릭했을때
   ind2 = $(this).index();
   if(ind2>0){
	   $("input[name=checkin2]").prop("disabled", false); //비활성화
	   $("input[name=checkout2]").prop("disabled", false);
	   $('input[name=crup]').val("up")
	   $('input[name=room_name]').val($("#confirm tr:eq("+ind2+") td:eq(2)").text());
	   $('input[name=checkin2]').val($("#confirm tr:eq("+ind2+") td:eq(4)").text());
	   $('input[name=checkout2]').val($("#confirm tr:eq("+ind2+") td:eq(5)").text());
	   $('input[name=how_many]').val($("#confirm tr:eq("+ind2+") td:eq(8)").text());
	   $('input[name=cs_name]').val($("#confirm tr:eq("+ind2+") td:eq(6)").text());
	   $('input[name=cs_mobile]').val($("#confirm tr:eq("+ind2+") td:eq(7)").text());
	   $('input[name=check_sum]').val($("#confirm tr:eq("+ind2+") td:eq(9)").text());
	   $('input[name=confim_id]').val($("#confirm tr:eq("+ind2+") td:eq(0)").text());
	   $('input[name=room_type]').val($("#confirm tr:eq("+ind2+") td:eq(3)").text());
	   $('input[name=room_id]').val($("#confirm tr:eq("+ind2+") td:eq(1)").text());
	   $('input[name=cus_oneday]').val($("#confirm tr:eq("+ind2+") td:eq(10)").text());
	   $('input[name=cus_max]').val($("#confirm tr:eq("+ind2+") td:eq(11)").text());
	   maxC= $('input[name=cus_max]').val()
	   return false;
   }else{
	   $('input[name=delete]').trigger('click');
   }
})


.on('change','input[name=checkin2]',function(){
	//총 숙박비용 계산 (체크인날짜 입력, 변경시)
	let tt = Number($('input[name=cus_oneday]').val());
	let ta = Number($('input[name=how_many]').val());
	let ti = $('input[name=checkin2]').val();
	let ti1 = ti.split('-');
	let tid = new Date(ti1[0],ti1[1],ti1[2]);
	let to = $('input[name=checkout2]').val();
	let to1 = to.split('-');
	let tod = new Date(to1[0],to1[1],to1[2]);
	let ts = tod-tid;
	let cDay = 24*60*60*1000;
	let tss = parseInt(ts/cDay);
	$('input[name=check_sum]').val(tt*ta*tss);
	return false
})

.on('change','input[name=checkout2]',function(){//총 숙박비용 계산 (체크아웃 날짜 입력, 변경시)
	let tt = Number($('input[name=cus_oneday]').val());
	let ta = Number($('input[name=how_many]').val());
	let ti = $('input[name=checkin2]').val();
	let ti1 = ti.split('-');
	let tid = new Date(ti1[0],ti1[1],ti1[2]);
	let to = $('input[name=checkout2]').val();
	let to1 = to.split('-');
	let tod = new Date(to1[0],to1[1],to1[2]);
	let ts = tod-tid;
	let cDay = 24*60*60*1000;
	let tss = parseInt(ts/cDay);
	$('input[name=check_sum]').val(tt*ta*tss);
	return false
	})

.on('click','input[name=confirm]',function(){/*예약확정(변경) 눌렀을때*/
	if($("input[name=cs_name]").val()==""){
		alert("대표자 이름을 입력하세요")
		$("input[name=cs_name]").focus()
		return false;
	}
	if($("input[name=cs_mobile]").val()==""){
		alert("대표자의 전화번호를 입력하세요")
		$("input[name=cs_mobile]").focus()
		return false;
	}
	let result = confirm('이대로 예약확정(변경) 하시겠습니까?')
	if(result){/*확인 눌렀을때*/
		if($('input[name=crup]').val()=='cr'){/*예약확정*/
			$.get("insertP2",{roomid:$("input[name=room_id]").val(),roomname:$("input[name=room_name]").val(),
		         roomtype:$("input[name=room_type]").val(),checkin2:$("input[name=checkin2]").val(),
		         checkout2:$("input[name=checkout2]").val(),howmany:$("input[name=how_many]").val(),
		         csname:$("input[name=cs_name]").val(),csmobile:$("input[name=cs_mobile]").val(),
		         checksum:$("input[name=check_sum]").val(),cusoneday:$("input[name=cus_oneday]").val(),
		         cusmax:$("input[name=cus_max]").val()},
		         function(data){
		            alert("객실예약정보가 저장되었습니다.")
		            location.reload();
		            return false;
		        })
		}else{/*예약변경*/
			$.get("updateP2",{roomid:$("input[name=room_id]").val(),roomname:$("input[name=room_name]").val(),
		         roomtype:$("input[name=room_type]").val(),checkin2:$("input[name=checkin2]").val(),
		         checkout2:$("input[name=checkout2]").val(),howmany:$("input[name=how_many]").val(),
		         csname:$("input[name=cs_name]").val(),csmobile:$("input[name=cs_mobile]").val(),
		         checksum:$("input[name=check_sum]").val(),cusoneday:$("input[name=cus_oneday]").val(),
		         confimid:$("input[name=confim_id]").val()},
		         function(data){
		            alert("객실예약정보가 변경되었습니다.")
		            location.reload();
		            return false;
		        })
		}
	}else{/*취소 눌렀을때*/
		alert('예약확정(변경)이 취소되었습니다.')
		$('input[name=delete]').trigger('click');
		return false;
	}
	
})

.on('click','input[name=cancel]',function(){//예약취소 버튼 눌렀을떄
	let result = confirm('이대로 예약일정 삭제를 하시겠습니까?')
	if(result){/*확인 눌렀을때*/
		$.get("deleteP2",{confimid:$("input[name=confim_id]").val()},
		        function(data){
		           alert("객실예약정보가 삭제되었습니다.")
		           location.reload();
		           return false;
		       })
	}else{
		alert('예약일정 삭제가 취소되었습니다.')
		$('input[name=delete]').trigger('click');
		return false;
	}
})

.on('click','input[name=delete]',function(){//비우기 버튼 눌렀을때
	$("input[name=room_id]").val("")
	$("input[name=room_name]").val("")
    $("input[name=room_type]").val("")
    $("input[name=checkin2]").val("")
    $("input[name=checkout2]").val("")
    $("input[name=how_many]").val("")
    $("input[name=cs_name]").val("")
    $("input[name=cs_mobile]").val("")
    $("input[name=check_sum]").val("")
    $("input[name=cus_oneday]").val("")
    $("input[name=confim_id]").val("")
    $("input[name=cus_max]").val("")
    $("input[name=crup]").val("cr");
	$("input[name=checkin2]").prop("disabled", true); //비활성화
	$("input[name=checkout2]").prop("disabled", true);
})

</script>
</html>