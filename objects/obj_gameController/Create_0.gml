//Player Stats
randomize();
playerSpoons = irandom_range(5, 15);
playerCash = 0;

//log params
log_box_width = 650;
log_box_height = 300;
log_box_x = 75;
log_box_y = 150;

//Log Setup
logText = []; //An array (list) to hold lines of the log
maxLogLines = 6; //Adjust based on how many lines you want to display

// Track the current choice and scenario index
global.currentChoicesIndex = 0;
global.currentScenarioIndex = 0;

//Degine Narrative structure here
global.choices = [
    [
        {actionName: "Eat Breakfast", actionCost: 2, actionMessage: "You feel energized, but you're still tired."},
        {actionName: "Skip Breakfast", actionCost: 0, actionMessage: "You feel a little hungry, but you saved spoons."},
        {actionName: "Grab a Coffee", actionCost: 1, actionMessage: "The caffeine helps, but you can feel the cost."}
    ],
    [
        {actionName: "Take a Shower", actionCost: 2, actionMessage: "The hot water feels nice, and you got clean."},
        {actionName: "Rest on the Couch", actionCost: 1, actionMessage: "Not as productive, but you saved energy."},
        {actionName: "Start Work Early", actionCost: 3, actionMessage: "You get a head start but feel drained."}
    ],
    [
        {actionName: "Call a Friend", actionCost: 2, actionMessage: "You feel emotionally lifted."},
        {actionName: "Ignore Messages", actionCost: 0, actionMessage: "You avoid stress, but feel isolated."},
        {actionName: "Write in Journal", actionCost: 1, actionMessage: "You feel a little clarity."}
    ]
];

// Store the scenario descriptions in an array
global.scenarios = [
    "Your eyes swing open to the sound of a barely-rhythmic alarm beep. You overslept.",
    "You're up, somehow. I suppose the day starts now.",
    "You have a 15 minute break before its time for more riveting work!"
];


//TODO Revise this func
function assignChoicesToButtons(index) {
    var choiceSet = global.choices[index];
	
    with (obj_button) {
        if (choiceSlot >= 0 && choiceSlot < array_length(choiceSet)) {
            var data = choiceSet[choiceSlot];

            actionName = data.actionName;
            actionCost = data.actionCost;
            actionMessage = data.actionMessage;
			formattedAction = actionName + "\nSpoon Cost: " + string(actionCost);

        } else {
            // Optional: disable or hide unused buttons
            actionName = "";
            actionCost = 0;
            actionMessage = "";
            formattedAction = "";
        }
    }
}

assignChoicesToButtons(global.currentChoicesIndex);
addToLog(global.scenarios[global.currentScenarioIndex], "scenario");
global.currentScenarioIndex += 1;