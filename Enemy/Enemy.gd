extends KinematicBody2D
var speed=100



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(speed*delta, 0))
	if (collidedObject):
		if (collidedObject.collider.name == "Player"):
			collidedObject.get_collider().queue_free()
			queue_free()
			get_tree().change_scene("res://UI/Died/Died.tscn")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
