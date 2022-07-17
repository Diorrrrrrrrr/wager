var myInterval = 0;
var shown = false;
var startedd = false;
$(function() {
	let enemycount = 0;
	let mycount = 0;
	leaderboards();
	$(".hej1").addClass("active");
	window.addEventListener('message', function(event) {
		switch (event.data.type) {
			case 'show':
				show();
				break;
			
			case 'LeaderBoard':
				$('.wagerlist tr:gt(0)').remove();
				$('.wagerlist').append(event.data.players);
				
				$('.wagerlist2 tr:gt(0)').remove();
				$('.wagerlist2').append(event.data.players2);

				refreshGangs();
				show();
				break;

			case 'Wager':
				$(".board").show()
				$(".board").animate({top: "-20%"}, 0);
				$(".board").animate({top: "0px"}, 1500);
				startedd = true;
				setTimeout(
				function() 
				{
					var div2 = $(".v15_46");
					var totalSeconds = 0;
					myInterval = setInterval(setTime, 1000);
				
					function setTime() {
						++totalSeconds;
						div2.text(parseInt(totalSeconds / 60) + ":" + pad(totalSeconds % 60));
						if (div2.text().length == 5) {
							div2.animate({left: "45%"}, "slow");
						} else {
							div2.animate({left: "46.25%"}, "slow");
						}
					}
				
					function pad(val) {
						var valString = val + "";
						if (valString.length < 2) {
							return "0" + valString;
						} else {
							return valString;
						}
					}
				}, 4000);
				break;
			case 'Stop':
				startedd = false;
				$(".board").animate({top: "-20%"}, 1500, function(){
					$(".v15_44").text("0");
					$(".v15_49").text("0");
					$(".v15_47").text("ROUND 1");
					$(".v15_46").text("0:00");
					$(".v15_46").animate({left: "46.25%"}, "slow");
					$(".v15_47").animate({left: "47.2%"}, "slow");
					clearInterval(myInterval);
					$(".board").hide();
				});
				enemycount = 0;
				mycount = 0;
				break;
			case 'UpdateMine':
				var div = $(".v15_44");
				mycount++;
				div.animate({top: "4.5%"}, 400, function(){
					div.text(mycount)
				});
				div.animate({top: "5.2%"}, 400);
				var rounds = enemycount + mycount + 1;
				var div3 = $(".v15_47");
				if (enemycount == 4 || mycount == 4) {
					div3.animate({left: "45.8333%"}, "slow");
					div3.text("MATCH POINT")
				} else {
					div3.text("ROUND " + rounds)
					div3.animate({left: "47.2%"}, "slow");
				}
				break;

			case 'UpdateEnemy':
				var div = $(".v15_49");
				enemycount++;
    			div.animate({top: "4.5%"}, 400, function(){
					div.text(enemycount)
				});
				div.animate({top: "5.2%"}, 400);
				var rounds = enemycount + mycount + 1;
				var div3 = $(".v15_47");
				if (enemycount == 4 || mycount == 4) {
					div3.animate({left: "45.8333%"}, "slow");
					div3.text("MATCH POINT")
				} else {
					div3.text("ROUND " + rounds)
					div3.animate({left: "47.2%"}, "slow");
				}
				break;
			
			default:
				break;
		}

});

document.onkeyup = function(data) {
	if (data.which == 27 && $(".script").css( "display" ) != "none") {
		hide();
	}
};
});

$(".img2").click(function() {
	managegang2();
});


function refreshGangs(){
    sorttype = 'gangxp';
    $('.gangs').empty();
    $.post('https://Relentless_wager/refreshGangs', JSON.stringify({column : sorttype}), function(data){
    $.each(data, function (index) {
        if(data[index].gangDeaths == 0){
            data[index].gangDeaths = 1
        }
        var gangkdRatio = (data[index].gangKills/data[index].gangDeaths).toFixed(2);
        var html = '<tr>';
        html += '<td>'+ data[index].gangLabel +'</td>';
        html += '<td>'+ data[index].gangXp +'</td>';
        html += '<td>'+ data[index].gangwarsWon +'</td>';
        html += '<td>'+ data[index].gangAirdropsCollected +'</td>';
        html += '<td>'+ data[index].gangKills +'</td>';
        html += '<td>'+ data[index].gangDeaths +'</td>';
        html += '<td>'+ gangkdRatio +'</td>';
        html += '</tr>'
        $('.gangs').append(html);
    });
});
}

function managegang() {
	$(".managegang2").hide(); 
	$(".leaderboards").hide(); 
	$(".topgang").hide(); 
	$(".hej1").removeClass("active");
	$(".managegang3").removeClass("active");
	$(".managegang").fadeIn(1000, "linear");  
}

function managegang2() {
	$(".managegang").hide(); 
	$(".leaderboards").hide(); 
	$(".topgang").hide(); 
	$(".hej1").removeClass("active");
	$(".managegang3").removeClass("active");
	$(".managegang2").fadeIn(1000, "linear");  
}

function managetopgangs() {
	$(".managegang").hide(); 
	$(".managegang2").hide(); 
	$(".leaderboards").hide(); 
	$(".hej1").removeClass("active");
	$(".leaderboards2").fadeIn(1000, "linear"); 
	// $(".topgang").fadeIn(1000, "linear"); 
	// $(".topgangs").addClass("active");
}

function managetopgangs2() {
	$(".managegang").hide(); 
	$(".managegang2").hide(); 
	$(".leaderboards").hide(); 
	$(".leaderboards2").hide(); 
	$(".hej1").removeClass("active");
	$(".managegang3").fadeIn(1000, "linear"); 
	$(".topgangs").addClass("active");
}


function leaderboards() {
	$(".managegang").hide(); 
	$(".topgang").hide(); 
	$(".managegang2").hide(); 
	$(".managegang3").hide(); 
	$(".leaderboards").fadeIn(1000, "linear");  
	$(".hej1").addClass("active");
	$(".topgangs").removeClass("active");
	$(".leaderboards2").hide();
}

function hide() {
	$.post("https://Relentless_wager/hide");
	$(".script").fadeOut();
	if (startedd == true) {
		$(".board").fadeIn()
	}
}

function show() {
	$(".script").fadeIn(1000, "linear"); 
	$(".board").hide()
}