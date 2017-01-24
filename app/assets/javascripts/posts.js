$(document).ready(function() {

	$(".not-liked").click(function() {
		console.log("Hello World")
		// div has data-(name you make up) to identify data 
		// inside element and bring up inside jquery
		
		var that = this;
		var myPostId = $(this).data('post-id');
		console.log(myPostId)

		$.post(
			"/likes", 
			{ post_id: myPostId, soda: "sprite" },
			function(data) {
				$(that).css("background-color" , "gray");
				// get the value
				var numlikes = $(".number-likes-"+myPostId).text() ;

				// convert it to a number
				// add one and put it back
				$(".number-likes-"+myPostId).text(parseInt(numlikes) + 1);


			}
		)



	})

})
