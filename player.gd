extends Area2D
signal hit

@export var jumpStrength = 300
var screenSize
var velocity

func _ready():
	screenSize = get_viewport_rect().size
	$Animation.play("default")
	velocity = (Vector2.ZERO)

func _process(delta):
	#if Input.is_action_just_pressed("jump"):
		#$JumpSound.play()
		#$Animation.play("jump")
		##print($Animation.position.y)
		#velocity.y = -jumpStrength
		#$AnimationTimer.start(0.5)
	#else:
		#velocity.y += (jumpStrength * 1.5) * delta
	if Input.is_action_just_pressed("switch"):
		$JumpSound.play()
		#print($Animation.position.y)
		#$AnimationTimer.start(0.5)
		if(velocity.y >= 0):
			velocity.y = -jumpStrength
			$Animation.play("jump")
			
		else:
			$Animation.play("default")
			velocity.y = jumpStrength
	if Input.is_action_just_pressed("hover"):
		$Timer.start()
		$Animation.play("default")
		velocity.y = 0
	#if Input.is_action_just_pressed("hover"):
		##$Line.scale.y = sqrt(($Animation.position.x - $Cursor.position.x)*($Animation.position.x - $Cursor.position.x) + ($Animation.position.y - $Cursor.position.y)*($Animation.position.y - $Cursor.position.y))
		##var angle = atan2($Cursor.position.x - $Animation.position.x, $Cursor.position.y - $Animation.position.y)* 180 / PI
		##$Line.rotation = move_toward(rotation, angle, delta)
		##print($Animation.position, " ", $Cursor.position, " ", $Line.scale.y)
		#velocity.y =  0
		#$Animation.position.y = $Cursor.position.y
		#$Collisions.position.y = $Cursor.position.y
	
	position += velocity * delta
	#$Cursor.position.y = get_local_mouse_position().y


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


func _on_timer_timeout():
	if velocity.y == 0:
		velocity.y = jumpStrength
