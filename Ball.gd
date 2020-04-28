extends RigidBody2D

func _ready():
	reset()

func reset():
	global_position.x = 640
	global_position.y = 30
	set_physics_process(false)
	$Timer.start() # equivalent to get_node("Timer").start()
	linear_velocity = Vector2(0,0)

func _physics_process(delta):
	linear_velocity *= 1.0025
	pass

func _on_Timer_timeout():
	linear_velocity = Vector2(-500, 300)
	set_physics_process(true)
	$Timer.stop() # equivalent to get_node("Timer").stop()
	pass

func _on_Ball_body_entered(body: Node):
	if body.name.find("Goal") == 0:
		if body.name == "Goal0":
			get_parent().get_node("Pad1").score += 1
		elif body.name == "Goal1":
			get_parent().get_node("Pad0").score += 1
			pass
		reset()
		pass
	pass
