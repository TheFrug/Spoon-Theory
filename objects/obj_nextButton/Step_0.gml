if ((global.gameState == "ready_next" || global.gameState == "narration") && !global.firstScenarioShown) {
    image_alpha = lerp(image_alpha, 1, 0.1);
    visible = true;
} else {
    image_alpha = lerp(image_alpha, 0, 0.1);
    if (image_alpha < 0.05) visible = false;
}
