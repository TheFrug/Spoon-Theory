function addToLog(_msg, _type) {
	var logEntry = {
	msg: _msg,
	type: _type
	};
	
	logEntry.current = 0;
	logEntry.timer = 0;
	
	with (obj_gameController) {
	array_push(logText, logEntry);
	
		if (array_length(logText) > maxLogLines) {
			array_delete(logText, 0, 1);
		}
	}
}