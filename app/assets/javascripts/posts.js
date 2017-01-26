$(document).ready(function() {
	attachClickListeners();
})

	// var myPostId = $(this).data('post-id');
	// 		console.log(myPostId)

	// 		$.post(
	// 			"/likes", 
	// 			{ post_id: myPostId, soda: "sprite" },
	// 			function(data) {
	// 				$(that).css("background-color" , "gray");
	// 				// get the value
	// 				var numlikes = $(".number-likes-"+myPostId).text() ;

	// 				// convert it to a number
	// 				// add one and put it back
	// 				$(".number-likes-"+myPostId).text(parseInt(numlikes) + 1);


	// 			}
	// 		)

function attachClickListeners() {
	$(".not-liked").click(attachNotLikedEvent)

	$(".liked").click(attachLikedEvent)
}

function attachLikedEvent(event) {

	var myPostId = $(this).data('post-id');
	console.log(myPostId)

	$.ajax({
		method: "DELETE",
		url: "/likes/" + myPostId,

	})
	.done(function( msg ) {
		
		var numlikes = $(".number-likes-"+myPostId).text() ;
		$(".number-likes-" +myPostId).text(parseInt(numlikes) - 1);
	});

	event.preventDefault();
	console.log("goodbye world");
	
	var that = this;
	$(that).removeClass("liked");
	$(that).addClass("not-liked");

	$(this).off("click") ;
	$(this).click(attachNotLikedEvent)
}

function attachNotLikedEvent(event) {
	

	var myPostId = $(this).data('post-id');
	console.log(myPostId)

	$.post(
		"/likes", 
		{ post_id: myPostId, soda: "sprite" },
		function(data) {
			var numlikes = $(".number-likes-"+myPostId).text() ;
			// convert it to a number
			// add one and put it back
			$(".number-likes-"+myPostId).text(parseInt(numlikes) + 1);
		}
	)




	event.preventDefault();
	console.log("hello world");
	

	var that = this;
	$(that).removeClass("not-liked");
	$(that).addClass("liked");

	$(this).off( "click");
	$(this).click(attachLikedEvent) 
}