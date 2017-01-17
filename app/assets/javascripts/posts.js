$(document).ready(function() {

	console.log("Hello World")
	$(".not-liked").click(function() {

		

		$(this).css("background-color" , "gray")
		$.post("/likes", { like: {post: $(this).data('post-id')}})
	})
})