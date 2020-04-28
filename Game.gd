extends Node2D

var DEFAULT_THRUST = Vector2(0.0, 400.0)

var pad0_thrust = Vector2(0,0)
var pad1_thrust = Vector2(0,0)

func _process(delta):
	if Input.is_action_pressed("pad0_up"):
		pad0_thrust = -DEFAULT_THRUST
	if Input.is_action_pressed("pad0_down"):
		pad0_thrust = DEFAULT_THRUST
	if Input.is_action_pressed("pad1_up"):
		pad1_thrust = -DEFAULT_THRUST
	if Input.is_action_pressed("pad1_down"):
		pad1_thrust = DEFAULT_THRUST

	$Score0.text = str(get_node("Pad0").score)
	$Score1.text = str(get_node("Pad1").score)
	pass

func _physics_process(delta):
	get_node("Pad0").set_linear_velocity(pad0_thrust)
	get_node("Pad1").set_linear_velocity(pad1_thrust)
	pad0_thrust *= 0.95
	pad1_thrust *= 0.95
