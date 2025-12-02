extends Area2D
var scale_y = randi_range(1, 30)
var height

func _ready():
	$Block.scale = Vector2(6, scale_y)
	$Collisions.scale = Vector2(6, scale_y)
	height = $Block.texture.get_height()
	
func _process(delta):
	var velocity = (Vector2.ZERO)
	velocity.x -= 100
	position += velocity * delta
	if($Block.position.x < 480):
		queue_free()
		print("wa")

func block_killer(boo):
	if (boo == true):
		queue_free()
