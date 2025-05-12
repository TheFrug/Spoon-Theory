// Game states: "scenario", "waiting_choice", "result", "narration", "ready_next"
global.gameState = "scenario";
global.pendingNarration = "";

// Player Stats
randomize();
playerSpoons = irandom_range(3, 8);
playerCash = 0;

// Log params
log_box_width = 650;
log_box_height = 340;
log_box_x = 75;
log_box_y = 130;

// Log Setup
logText = []; //An array (list) to hold lines of the log
maxLogLines = 6; //Adjust based on how many lines you want to display

// Day Count Tracking
global.currentDay = 1;
maxDays = 3;

// Track the current choice and scenario index
global.currentChoicesIndex = 0;
global.currentScenarioIndex = 0;

// Makes things work
global.firstScenarioShown = true; // This will be true only once

//Degine Narrative structure here
global.choices = [
    [
        {actionName: "Spring out of Bed", actionCost: 2, actionMessage: "You jump out of bed, eyes still crusty. Some people do this every day!", isUnknownCost: true},
        {actionName: "Snooze Alarm", actionCost: 0, actionMessage: "The sweet nectar of sleep! It smells much nicer than it tastes, and you are awake before you know it.", isUnknownCost: false},
        {actionName: "Mentally Prepare", actionCost: 1, actionMessage: "You imagine all the brilliant things you can do today... after you get off work.", isUnknownCost: false}
    ],
	[
        {actionName: "Morning Exercise", actionCost: 2, actionMessage: "You feel silly breaking a sweat in your bedroom, but your body is hella thankful.", isUnknownCost: false},
        {actionName: "Journal", actionCost: 1, actionMessage: "Once you pick up the pen, the words flow easily. You organize a little to-do list for yourself.", isUnknownCost: true},
        {actionName: "Doomscroll", actionCost: 1, actionMessage: "Oh God, the news. You find out someone else you love lost rights today.", isUnknownCost: true}
    ],
    [
        {actionName: "Take a Shower", actionCost: 1, actionMessage: "The hot water is great! You come out steaming fresh, like dumplings!", isUnknownCost: true},
        {actionName: "Rest on the Couch", actionCost: 0, actionMessage: "Not what I'd call productive, but at least you saved some energy.", isUnknownCost: false},
        {actionName: "Start Work Early", actionCost: 3, actionMessage: "You sacrifice some of your priceless morning time to do some tasks, like a warm-up for your actual job.", isUnknownCost: false}
    ],
    [
        {actionName: "Make Breakfast", actionCost: 2, actionMessage: "It took some intense multitasking, but you made a great spread! Look at all those nutrients!", isUnknownCost: true},
        {actionName: "Coffee'll Do", actionCost: 1, actionMessage: "The important machine hisses 6oz of life fuel into a porcelain mug that reads '#1 Son'. Thanks, mom.", isUnknownCost: false},
        {actionName: "Skip Food", actionCost: 0, actionMessage: "Despite your body's protests, you skip a meal. You'll have to buy it on the way...", isUnknownCost: false}
    ]
];

// Store the scenario descriptions in an array
global.scenarios = [
    "Your eyes swing open, the sound of a barely-rhythmic beeping piercing your eardrums. You overslept.",
    "Like it or not, you're up. That means it's time to start the day!",
    "You have work in an hour. It feels like there's still so much to do...",
	"You haven't eaten, yet, and your tummy has begun to throw a fit about it."
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
			isUnknownCost = data.isUnknownCost;
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
global.gameState = "waiting_choice";