extends Area2D
signal hit

@export var jumpStrength = 200
var screenSize
var velocity

func _ready():
	screenSize = get_viewport_rect().size
	$Animation.play("default")
	velocity = (Vector2.ZERO)
	$Marker2D.position.x = $Animation.position.x + 60
	$Marker2D.position.y = $Animation.position.y - 10
	$Line.position = $Marker2D.position

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		$JumpSound.play()
		$Animation.play("jump")
		#print($Animation.position.y)
		velocity.y = -jumpStrength
		$AnimationTimer.start(0.5)
	else:
		velocity.y += (jumpStrength * 1.5) * delta
	
	if Input.is_action_just_pressed("grapple"):
		#$Line.scale.y = sqrt(($Animation.position.x - $Cursor.position.x)*($Animation.position.x - $Cursor.position.x) + ($Animation.position.y - $Cursor.position.y)*($Animation.position.y - $Cursor.position.y))
		#var angle = atan2($Cursor.position.x - $Animation.position.x, $Cursor.position.y - $Animation.position.y)* 180 / PI
		#$Line.rotation = move_toward(rotation, angle, delta)
		#print($Animation.position, " ", $Cursor.position, " ", $Line.scale.y)
		velocity.y =  0
		$Animation.position.x = $Cursor.position.x
		$Animation.position.y = $Cursor.position.y
		$Collisions.position.x = $Cursor.position.x
		$Collisions.position.y = $Cursor.position.y
	
	position += velocity * delta
	$Cursor.position = get_local_mouse_position()


func _on_animation_timeout():
	$Animation.play("default")

func _on_area_entered(body):
	hide()
	hit.emit()
	$Collisions.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$Collisions.disabled = false
