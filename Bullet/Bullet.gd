extends KinematicBody2D
onready var Score = get_node("/root/MainGame/HUD/Score")
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if (get_tree().get_current_scene().get_name() != "MainGame"):
		queue_free()
	var collidedObject = move_and_collide(Vector2(-speed*delta, 0))
	if (position.x <= -600):
		print("Delete Bullet")
		queue_free()
	if (collidedObject):
		print(collidedObject.collider.name)
		if ("Enemy" in collidedObject.collider.name):
			collidedObject.get_collider().queue_free()
			GlobalVariables.scoringInformation["currentScore"] = GlobalVariables.scoringInformation["currentScore"] + 5
			Score.text = ("Score: " + str(GlobalVariables.scoringInformation["currentScore"]))
			queue_free()

