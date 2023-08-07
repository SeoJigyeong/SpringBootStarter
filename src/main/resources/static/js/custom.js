let name = document.fr.getElementById('name');
let resv_date = document.fr.getElementById('resv_date');
let room = document.fr.getElementById('room');
let addr = document.fr.getElementById('addr');
let phone = document.fr.getElementById('phone');
let in_name = document.fr.getElementById('in_name');
let comment = document.fr.getElementById('comment');

if((name.keyCode < 12592) || (name.keyCode > 12687)){
	  alert("한글만 입력이 가능합니다.");
	  event.keycode=8;
	  event.returnValue = false
}

let newAddr = addr.replace(" ", "");
if(newAddr.length == 0 || addr.length > 30 ){
    alert("주소란에는 공백이 올 수 없고, 주소가 올바르지 않습니다");
    document.fr.name.focus();
    return false;
 }

if(phone.length == 0 || phone.length > 30 ){
    alert("번호란에는 공백이 올 수 없고, 번호가 올바르지 않습니다");
    document.fr.name.focus();
    return false;
 }

if((in_name.keyCode < 12592) || (in_name.keyCode > 12687)){
  alert("한글만 입력이 가능합니다.");
  event.keycode=8;
  event.returnValue = false
}
