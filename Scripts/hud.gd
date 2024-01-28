extends CanvasLayer
signal start_game
var time_remaining := 0.0
@onready var score1 = $Score1
@onready var score2 = $Score2


func _ready():
	time_remaining = 60*2

func _process(delta: float) -> void:
	time_remaining -= delta
	set_timer(snappedf(time_remaining, 0.01)) 
	update_scores()
	
	
func set_timer(time):
	$Time.text = str(time)

func update_scores():
	score1.text = str(Globals.player1_score)
	score2.text = str(Globals.player2_score)
