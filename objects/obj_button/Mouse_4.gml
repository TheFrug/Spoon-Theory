if (!isLogTyping()){
	if (obj_gameController.playerSpoons >= actionCost) {
	    obj_gameController.playerSpoons -= actionCost;
	    addToLog(actionMessage, "result");
	
		// Show the Next button
		with (obj_nextButton) visible = true;
	}
}
