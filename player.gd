extends Area2D

signal hit
signal update_health(health)
signal win
signal die

@export var speed = 300 # How fast the player will move (pixels/sec).

var active = true # Is gameplay active
var screen_size # Size of the game window.
var player_health = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	var animated_sprite = $AnimatedSprite2D
	animated_sprite.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		var velocity = Vector2.ZERO # The player's movement vector.
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1

		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
			
		position += velocity * delta
		position = position.clamp(Vector2.ZERO, screen_size)
	else:
		pass

func _on_body_entered(body):
	player_health -= 1
	hit.emit()
	update_health.emit(player_health)
	if player_health <= 0:
		die.emit()
		active = false;
	
func start(pos):
	position = pos
	active = true
	player_health = 10
	show()

func _on_goal_area_entered(area):
	active = false;
	win.emit()
	pass # Replace with function body.
