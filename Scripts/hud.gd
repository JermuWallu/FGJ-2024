extends CanvasLayer
signal start_game
var time_elapsed := 0.0


func _process(delta: float) -> void:
	time_elapsed += delta
	set_timer(snappedf(time_elapsed, 0.01)) 
	
func set_timer(time):
	$Time.text = str(time)
