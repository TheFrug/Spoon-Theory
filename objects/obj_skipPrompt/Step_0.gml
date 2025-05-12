//Check if log is typing
var typing = isLogTyping();

if (typing) {
	// Fade In
	alpha = clamp(alpha + fadeSpeed, 0, 1);
} else {
	alpha = clamp(alpha - fadeSpeed, 0, 1);
}