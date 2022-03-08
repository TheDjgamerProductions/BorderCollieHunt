extends KinematicBody2D
onready var Score = get_node("/root/MainGame/HUD/Score")
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(-speed*delta, 0))
	if (collidedObject):
		if ("Enemy" in collidedObject.collider.name):
			collidedObject.get_collider().queue_free()
			GlobalVariables.scoringInformation["currentScore"] = GlobalVariables.scoringInformation["currentScore"] + 5
			Score.text = ("Score: " + str(GlobalVariables.scoringInformation["currentScore"]))
			queue_free()
		if ("Border" in collidedObject.collider.name):
			queue_free()
		
