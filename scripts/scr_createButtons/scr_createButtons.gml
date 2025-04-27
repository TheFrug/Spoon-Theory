function createButtons(index) {
    var button_spacing = 60;
    var start_y = 100;
    var start_x = 100;
	
	var choices = global.choices[index];

	 for (var i = 0; i < array_length(choices); i++) {
        var btn = instance_create_layer(start_x, start_y + i * button_spacing, "Instances", obj_button);
        
        btn.actionName = choices[i].actionName;
        btn.actionCost = choices[i].actionCost;
        btn.actionMessage = choices[i].actionMessage;
        btn.formattedAction = btn.actionName + " - " + string(btn.actionCost) + " spoons";
        btn.choiceIndex = i;
    }
}
