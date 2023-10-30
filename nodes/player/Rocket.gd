extends Area2D

@export var speed = 400
var screen_size

signal hit

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_RIGHT) && Input.is_key_pressed(KEY_Z):
		velocity.x += 1
	if Input.is_key_pressed(KEY_LEFT) && Input.is_key_pressed(KEY_Z):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	pass

func _on_body_entered(body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	pass # Replace with function body.
