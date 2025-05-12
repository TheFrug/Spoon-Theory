if (!isLogTyping()){
	if (global.gameState == "waiting_choice" && obj_gameController.playerSpoons >= actionCost) {
	    obj_gameController.playerSpoons -= actionCost;
	    addToLog(actionMessage, "result");
    
		// Add cost message
		var costMsg = "This cost you " + string(actionCost) + " spoons. You have " + string(obj_gameController.playerSpoons) + " remaining.";
		addToLog(costMsg, "other");
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
