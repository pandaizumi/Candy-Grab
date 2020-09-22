extends Node

export (PackedScene) var Candy
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	score = 0
	$Player.start($StartPos.position)
	spawn_candy()

func spawn_candy():
	var candy  = Candy.instance()
	$Candies.add_child(candy)
	candy.spawn()


func _process(delta):
	if $Candies.get_child_count() == 0:
		spawn_candy()


func collect_candy():
	score += 1
