extends Control

func _on_ready() -> void:
	$MarginContainer/P_Settings/VBC_Settings/HSlider.value = Global.volume
	$AudioStreamPlayer.volume_db = linear_to_db(Global.volume)
	$AudioStreamPlayer.play()
	
func _on_h_slider_value_changed(value: float) -> void:
	$AudioStreamPlayer.volume_db = linear_to_db(value)
