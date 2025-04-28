function isLogTyping() {
	for (var i = 0; i < array_length(logText); i++) {
		var entry = logText[i];
		if (entry.current < string_length(entry.msg)) {
			return true; // A line is still typing
		}
	}
	return false; // All lines are done
}