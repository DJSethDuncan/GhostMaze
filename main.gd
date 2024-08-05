extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$Player.start($PlayerStartPosition.position)
	$Goal.start($GoalStartPosition.position)
	$HUD.start()

func _on_restart_button_pressed():
	new_game()
	pass # Replace with function body.
