extends Control

signal start_game
var time_remaining := 0.0
@onready var score1 = $score1/VBoxContainer/Score1
@onready var score2 = $score2/VBoxContainer/Score2




func _ready():
	time_remaining = 60  #time limit	

func _process(delta: float) -> void:
	time_remaining -= delta
	set_timer(snappedf(time_remaining, 0.01)) 
	
	if (time_remaining <= 0):
		pass #TODO: end game logic
		
	update_scores()
	
	
func set_timer(time):
	$timer/VBoxContainer/Time.text = str(time)


func update_scores():
	score1.text = str(Globals.player1_score)
	score2.text = str(Globals.player2_score)
