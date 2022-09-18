extends KinematicBody2D

var velocity = Vector2(0,0)
var friction = 0.1
var acceleration = 0.5
const HIZ = 180
const MARYO = -500
const ELMA_ADAM = 22

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
 
	update_activity()

func update_activity() -> void:
	if Global.level==0:
			var activity = Discord.Activity.new()

			activity.set_type(Discord.ActivityType.Playing)
			activity.set_state("Ne Oynuyorum Ben Mk Diyor")
			activity.set_details("Level 1")

			var assets = activity.get_assets()
			assets.set_large_image("1u3zh54edtm81")
			assets.set_large_text("UwU")
	
	

			var result = yield(Discord.activity_manager.update_activity(activity), "result").result
			if result != Discord.Result.Ok:
				push_error(str(result))
	elif Global.level==1:
			var activity = Discord.Activity.new()

			activity.set_type(Discord.ActivityType.Playing)
			activity.set_state("Parkuru Kodlyana Sövüyor")
			activity.set_details("Level 2")

			var assets = activity.get_assets()
			assets.set_large_image("ice3")
			assets.set_large_text("El Psy Congroo")
	
	

			var result = yield(Discord.activity_manager.update_activity(activity), "result").result
			if result != Discord.Result.Ok:
				push_error(str(result))
	else:
			var activity = Discord.Activity.new()

			activity.set_type(Discord.ActivityType.Playing)
			activity.set_state("Bu kadar Mıydı La Diyor")
			activity.set_details("Raftel")

			var assets = activity.get_assets()
			assets.set_large_image("luffy2")
			assets.set_large_text("Nothing Nothing Happened")
	
	

			var result = yield(Discord.activity_manager.update_activity(activity), "result").result
			if result != Discord.Result.Ok:
				push_error(str(result))
func _physics_process(delta):
	print(Global.level)
	var input_dir = 0

	if Input.is_action_pressed("right"):
		input_dir += 1
	if Input.is_action_pressed("left"):
		input_dir -= 1


	velocity.y = velocity.y + ELMA_ADAM

	if Input.is_action_just_pressed("zıpla") and is_on_floor():
		velocity.y = MARYO

	if Input.is_action_pressed("aşağı"):
		velocity.y = -MARYO
	if input_dir != 0:
		velocity.x = lerp(velocity.x, input_dir * HIZ, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

	velocity = move_and_slide(velocity,Vector2.UP)


func _on_alan_body_entered(body):
	if body.name == ("necati"):
			set_position(Vector2(-1036,405))
			

func _on_finish_body_entered(body):
	if body.name == ("necati"):
		get_tree().change_scene("res://level2.tscn")
		Global.level+=1


func _on_b1_body_entered(body):
	if body.name == ("necati"):
		friction = 0.001
		acceleration = 0.1

func _on_b1_body_exited(body):
	if body.name == ("necati"):
		friction = 0.1
		acceleration = 0.5


func _on_annen_body_entered(body):
	if body.name == ("necati"):
		set_position(Vector2(-1036,405))
		
		friction = 0.1
		acceleration = 0.5


func _on_Area2D_body_entered(body):
	if body.name == ("necati"):
		friction = 0.1
		acceleration = 0.5


func _on_b2_body_entered(body):
	if body.name == ("necati"):
		friction = 0.001
		acceleration = 0.1


func _on_annen2_body_entered(body):
	if body.name == ("necati"):
		set_position(Vector2(867,479))
		
		friction = 0.1
		acceleration = 0.5





func _on_alan2_body_entered(body):
	if body.name == ("necati"):
			set_position(Vector2(624,496))
			

func _on_f2_body_entered(body):
	if body.name == ("necati"):
		get_tree().change_scene("res://raftel.tscn")
		Global.level+=5


#SÜRÜM 0.0.9 


#func _on_Area2D2_body_entered(body):
	#if body.name == ("necati"):
			#get_tree().change_scene("res://RAFTEL.tscn")match level:
