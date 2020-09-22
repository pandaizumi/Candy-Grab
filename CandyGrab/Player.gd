extends Area2D

#signal collect

export var speed = 150
var screen_size


func _ready():
	screen_size = get_viewport_rect().size


func start(pos):
	position = pos

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$Anim.play("right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$Anim.play("left")
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$Anim.play("down")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$Anim.play("up")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		$Anim.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0 + 6, screen_size.x - 8)
	position.y = clamp(position.y, 0 + 7, screen_size.y - 16)


func _on_Player_area_entered(area):
	area.collect()
	#emit_signal("collect")
