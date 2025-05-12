if (!isLogTyping()) {
    if (global.gameState == "narration") {
        addToLog(global.pendingNarration, "other");
        global.pendingNarration = "";
        global.gameState = "ready_next";
    } else if (global.gameState == "ready_next") {
        global.currentScenarioIndex += 1;

        if (global.currentScenarioIndex < array_length(global.scenarios)) {
            addToLog(global.scenarios[global.currentScenarioIndex], "scenario");
            global.gameState = "waiting_choice";
            obj_gameController.assignChoicesToButtons(global.currentChoicesIndex);
        } else {
            endDay(); // Handles resetting indexes and days
        }
    }
}