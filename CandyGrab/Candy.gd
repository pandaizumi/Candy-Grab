extends Area2D

const TILE_SIZE = 32
var screen_size

var coords = [Vector2(0,0), Vector2(1,0), Vector2(2,0)]


func _ready():
	$Anim.play("hover")

func spawn():
	screen_size = get_viewport_rect().size
	position = Vector2(rand_range(16, screen_size.x - 16), 
		rand_range(16, screen_size.y - 16))
	$Sprite.frame_coords = coords[randi() % coords.size()]


func collect():
	queue_free()
