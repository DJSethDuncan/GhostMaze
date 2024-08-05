extends CanvasLayer

@export var player_path: NodePath = "../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_node(player_path)
	init_HUD()
	player.update_health.connect(self._on_update_health)
	player.win.connect(self._on_win)
	player.die.connect(self._on_death)

func _on_update_health(health):
	$Health.text = str(health)

func _on_death():
	$Status.text = "DEAD"

func _on_win():
	$Status.text = "WIN"

# initialize the hud values -- probably should eventually make these variables
func init_HUD():
	$Health.text = str(10)
