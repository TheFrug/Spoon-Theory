if (keyboard_check_pressed(vk_space)) {
	for (var i = 0; i < array_length(logText); i++) {
		logText[i].current = string_length(logText[i].msg);
		logText[i].timer = 0;
	}
}
