var circle,bets=100500,timeleft=120,ms=1000;
var audioElement = document.createElement('audio');
audioElement.setAttribute('src', 'audio.mp3');
var audioElement2 = document.createElement('audio');
audioElement2.setAttribute('src', 'msg.mp3');
var ls=0;
var roulet=0;
var timerinterval;
var timerinterval1;
var my_delay = 30000;
window.onload = function onLoad() {
	checkBotStatus();
	$(document).ready(function(){
	timerinterval1 = setInterval("reloadinfo1()",1000);
	
	$(document).on('click', '.sound-link-on', function() {
                $('.sound-link-on').addClass('hidden');
                $('.sound-link-off').removeClass('hidden');
                var audioElement = document.createElement('audio');
				audioElement.setAttribute('src', 'audio/1.mp3');
				var audioElement2 = document.createElement('audio');
				audioElement2.setAttribute('src', 'audio/1.mp3');
				var audioElement3 = document.createElement('audio');
				audioElement3.setAttribute('src', 'audio/1.mp3');
        });

        $(document).on('click', '.sound-link-off', function() {
                $('.sound-link-off').addClass('hidden');
                $('.sound-link-on').removeClass('hidden');
                var audioElement = document.createElement('audio');
				audioElement.setAttribute('src', 'audio/audio.mp3');
				var audioElement2 = document.createElement('audio');
				audioElement2.setAttribute('src', 'audio/msg.mp3');
				var audioElement3 = document.createElement('audio');
				audioElement3.setAttribute('src', 'audio/open.wav');
        });
		
		$(document).on('click', '.closech', function() {
				$('.closech').addClass('hidden');
				$('.closechs').removeClass('hidden');
				$('.hjgf').removeClass('hidden');
		});
		$(document).on('click', '.closechs', function() {
				$('.closech').removeClass('hidden');
				$('.closechs').addClass('hidden');
				$('.hjgf').addClass('hidden');
        });
	});
	circle = new ProgressBar.Circle('#prograsd', {
		color: '#ff6666',
		strokeWidth: 12,
		easing: 'easeInOut',
		trailColor: "#FF3F3F"
	});
	circle.animate(1);
	timerinterval = setInterval("reloadinfo()",1000);
	setInterval("reloadinfo()",1000);
	setInterval("checkBotStatus()",60000);
	setInterval("updatetimer()",1);
};


function alert2(txt,typet) {
	var n = noty({
		layout: 'topRight',
		text: txt,
		type: typet,
		timeout: 10000
	});
	audioElement.play();
}

function updatetimer() {
	var d = new Date();
    var n = 99-Math.round(d.getMilliseconds()/10);
	if(timeleft == 120) n = 0;
	if(n < 0) n = 0
	if(timeleft <= 0) n = 0;
	if(timeleft < 0) timeleft = 0;
	if(n < 10) $('#timeleft').text(timeleft+'.0'+n);
	else $('#timeleft').text(timeleft+'.'+n);
}

function reloadinfo() {
	$.ajax({
		type: "GET",
		url: "currentgame.php",
		success: function(msg){
			$("#gameid").text("#"+msg);
		}
	});
	$.ajax({
		type: "GET",
		url: "currentchance.php",
		success: function(msg){
			$("#mychance").text(msg);
		}
	});
	$.ajax({
		type: "GET",
		url: "currentitems.php",
		success: function(msg){
			if(msg > 50) msg = 50;
			circle.animate(msg/50);
			$('.progressbar__label').text(msg+'/50');
		}
	});
	$.ajax({
		type: "GET",
		url: "currentbank.php",
		success: function(msg){
			$('#bank').text(msg+'');
		}
	});
	
	  $.ajax({
		type: "GET",
		url: "ite.php",
		success: function(msg){
			$('.players').html(msg);
		}
	});
	$.ajax({
		type: "GET",
		url: "items.php",
		success: function(msg){
			$('.rounditems').html(msg);
		}
	});
$.ajax({
		type: "GET",
		url: "timeleft.php",
		success: function(msg) {
			timeleft = msg;
		}
	});
	
	 
  
}
function reloadinfo1() {
	  $.ajax({
		type: "GET",
		url: "lastwinner.php",
		success: function(msg){
			$('.last-winner').html(msg);
		}
	});
	
		$.ajax({
		type: "GET",
		url: "currentgame.php",
		success: function(msg){
			$('.lot_current_game_id').html(msg);
		}
	});
	
	
	}
	function checkBotStatus() {
	$.ajax({
		type: "GET",
		url: "bot.php",
		success: function(msg) {
			if (msg == "Online")
				$('#bstatus').css("color", "#238908");
			else
				$('#bstatus').css("color", "#ff3f3f");
			$('#bstatus').text(msg);
		}
	});
}