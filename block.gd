extends Area2D
var scale_y = randi_range(1, 20)

func _ready():
	$Block.scale = Vector2(1, scale_y)
	$Collisions.scale = Vector2(1, scale_y)
	#print($Collisions.scale, $Block.scale)
