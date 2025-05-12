function isLogTyping() {
	for (var i = 0; i < array_length(obj_gameController.logText); i++) {
		var entry = obj_gameController.logText[i];
		if (entry.current < string_length(entry.msg)) {
			return true; // A line is still typing
		}
	}
	return false; // All lines are done
}