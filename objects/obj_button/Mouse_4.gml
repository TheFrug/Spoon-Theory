if (!isLogTyping()){
	if (global.gameState == "waiting_choice" && obj_gameController.playerSpoons >= actionCost) {
	    obj_gameController.playerSpoons -= actionCost;
	    addToLog(actionMessage, "result");
    
	    global.currentChoicesIndex += 1;
		global.firstScenarioShown = false;
	    // Check for narration associated with the action
	    if (variable_instance_exists(id, "narration")) {
	        global.pendingNarration = narration;
	        global.gameState = "narration";
	    } else {
	        global.gameState = "ready_next";
	    }
	} else if (global.gameState == "waiting_choice") {
	    addToLog("Not enough spoons!", "other");
	}
}
