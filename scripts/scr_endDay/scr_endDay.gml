function endDay(){
	// Give summary message based on remaining spoons
    if (obj_gameController.playerSpoons <= 0) {
        addToLog("You completely ran out of spoons today. Tomorrow might be even harder.", "other");
        obj_gameController.playerSpoons = max(1, irandom_range(1, 5)); // Penalty: fewer spoons next day
    } else if (obj_gameController.playerSpoons < 3) {
        addToLog("You barely made it through the day. Try to pace yourself tomorrow.", "other");
        obj_gameController.playerSpoons = irandom_range(3, 6);
    } else {
        addToLog("You managed your energy well today. You're feeling okay.", "other");
        obj_gameController.playerSpoons = irandom_range(4, 8); // Reward: better energy tomorrow
    }

    // Advance to next day
    obj_gameController.currentDay += 1;

    if (obj_gameController.currentDay > obj_gameController.maxDays) {
        addToLog("You've made it to the end of the game. Well done!", "other");
        // Optional: trigger game over screen or final summary
        return;
    }

    // Reset indexes for the new day
    global.currentScenarioIndex = 0;
    global.currentChoicesIndex = 0;

    // Optionally shuffle or refresh scenarios if you want randomness between days

    addToLog("Day " + string(obj_gameController.currentDay) + " begins...", "scenario");

    obj_gameController.assignChoicesToButtons(global.currentChoicesIndex);
    addToLog(global.scenarios[global.currentScenarioIndex], "scenario");
}