# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# disappear if you click the info
$ ->
	$('.dress-info').click ->
		$(this).parent('.dress-card').remove();

###		
$ ->
	$('#search').click ->
		$('#find').attr('style','visibility:visible;');
		$('.main').attr('style','top:100px;');
###
	
$ ->
	$('#search').click ->
		$('#find').slideToggle('slow') 
		
			
