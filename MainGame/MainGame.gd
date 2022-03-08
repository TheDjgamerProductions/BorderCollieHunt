extends Control
export(int) var countdownMax
var currentTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownMax
	while currentTimer != 0:
		$HUD/Countdown.text = ("Timer: " + str(currentTimer))
		yield(get_tree().create_timer(1.0), "timeout")
		currentTimer = currentTimer - 1 
		
	get_tree().change_scene("res://UI/End/End.tscn")
	currentTimer = countdownMax
func _process(delta):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



