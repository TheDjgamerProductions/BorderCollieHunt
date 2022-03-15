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
		
	if GlobalVariables.scoringInformation["highScore"] < GlobalVariables.scoringInformation["currentScore"]:
		GlobalVariables.scoringInformation["highScore"] = GlobalVariables.scoringInformation["currentScore"]
	currentTimer = countdownMax
	GlobalVariables.prevScores.push_back(GlobalVariables.scoringInformation["currentScore"])
	print(GlobalVariables.prevScores)
	GlobalVariables.scoringInformation["currentScore"] = 0
	
	get_tree().change_scene("res://UI/End/End.tscn")

func _process(delta):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



