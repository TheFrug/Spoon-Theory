if (obj_gameController.playerSpoons >= actionCost) {
    obj_gameController.playerSpoons -= actionCost;
    addToLog(actionMessage, "result");
	
	// Increment indexes
    global.currentChoicesIndex += 1;
	global.currentScenarioIndex += 1;
	
	// Display new scenario
	if (global.currentScenarioIndex < array_length(global.scenarios)) {
		addToLog(global.scenarios[global.currentScenarioIndex], "scenario");
	} else {
	    addToLog("There are no more scenarios.", "other");
	}
	
    if (global.currentChoicesIndex < array_length(global.choices)) {
        obj_gameController.assignChoicesToButtons(global.currentChoicesIndex);
    } else {
        addToLog("You're out of choices for the day.", "other");
    }
} else {
    addToLog("Not enough spoons!", "other");
}
