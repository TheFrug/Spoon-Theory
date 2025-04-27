/*
function addToLog(_msg, _type) {
		//Set color based on type
		if (_type == "scenario") {
			draw_set_color(c_white); // Color for scenario text
		} else if (_type == "result") {
			draw_set_color(c_green); // Color for choice result text
		} else if (_type == "other") {
			draw_set_color(c_red); //Color for other stuff	
		}
		
		with (obj_gameController) {
		array_push(logText, _msg);
	    if (array_length(logText) > maxLogLines) {
	        array_delete(logText, 0, 1); // Remove oldest log
	    }
	}
}
*/

function addToLog(_msg, _type) {
	var logEntry = {
	msg: _msg,
	type: _type
	};
	
	with (obj_gameController) {
	array_push(logText, logEntry);
	
		if (array_length(logText) > maxLogLines) {
			array_delete(logText, 0, 1);
		}
	}
}