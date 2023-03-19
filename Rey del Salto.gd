extends KinematicBody2D

var velocitat := 200
var MaxJump := -600
var MinJump := -200
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN * 750
var salt := Vector2.UP
var time = 0
var MaxTime := 0.5

func _ready():
	pass



func _process(delta):
	
	moviment += gravetat * delta
#	if Input.is_action_just_pressed("salta") and is_on_floor():
#		moviment += salt
	
	if is_on_floor():
		moviment.x = Input.get_axis("ves_esquerra","ves_dreta") * velocitat
	
	if Input.is_action_pressed("salta") and is_on_floor():
		time += delta
		if time >=MaxTime:
			time = MaxTime
			if Input.is_action_just_released("salta"):
				moviment.y += MaxJump
				time = 0
		
	if Input.is_action_just_released("salta") and is_on_floor():
		moviment.y = ((MaxJump - MinJump)* (time/MaxTime) + MinJump)
		time = 0
		
		
	moviment = move_and_slide(moviment, Vector2.UP)
	
	
#	var direccio := Vector2.ZERO
#	if Input.is_action_pressed("ves_dreta"):
#		direccio += Vector2.RIGHT
#	if Input.is_action_pressed("ves_esquerra"):
#		direccio += Vector2.LEFT
#	if Input.is_action_pressed("ves_amunt"):
#		direccio += Vector2.UP 

	
