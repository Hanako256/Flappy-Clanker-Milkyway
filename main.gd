extends Node2D
@export var block_scene: PackedScene
@export var frequency = 1

func _ready():
	$BlockTimer.wait_time = frequency

func _process(delta):
	#_block_mover()
	pass

func _on_timeout():
	var block = block_scene.instantiate()
	block.position.x = 500
	block.position.y = 0
	#block.position = $Player/Animation.position
	$BlockTimer.start()
	add_child(block)

func _block_mover(block):
	block.position.x -= 5
