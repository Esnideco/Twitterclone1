$(document).ready(function() {

	console.log("Hello World")
	$(".not-liked").click(function() {

		$(this).css("background-color" , "gray")
		$.post(
			"/likes", 
			{ post_id: $(this).data('post-id'), soda: "sprite" },
			function(data) {
				console.log(data)
			}
		)
	})
})
