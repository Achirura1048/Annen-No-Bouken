extends KinematicBody2D

var velocity = Vector2()
export var zoro = -1

func _physics_process(delta):
	velocity.y += 20
	
	velocity.x = 50 * zoro
	
	move_and_slide(velocity)


