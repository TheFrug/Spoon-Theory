if (!isLogTyping()) {
    // Advance indexes
    global.currentChoicesIndex += 1;
    global.currentScenarioIndex += 1;

    // Display new scenario
    if (global.currentScenarioIndex < array_length(global.scenarios)) {
        addToLog(global.scenarios[global.currentScenarioIndex], "scenario");
    } else {
        endDay();
    }

    if (global.currentChoicesIndex < array_length(global.choices)) {
        obj_gameController.assignChoicesToButtons(global.currentChoicesIndex);
    } else {
        addToLog("You're out of choices for the day.", "other");
    }

    // Hide button until next log finishes typing
    visible = false;
}