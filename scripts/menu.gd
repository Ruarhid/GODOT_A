extends Control

func _on_ready() -> void:
	$MarginContainer/P_Settings/VBC_Settings/HSlider.value = Global.volume
	print("volume= ", Global.volume)
	print("db= ", linear_to_db(Global.volume))
	$AudioStreamPlayer.volume_db = linear_to_db(Global.volume)
	$AudioStreamPlayer.play()
	

	print("AudioStreamPlayer ", $AudioStreamPlayer.volume_db)
	print("HSlider ", $MarginContainer/P_Settings/VBC_Settings/HSlider.value)
	print("volume= ", Global.volume)
	
func _on_h_slider_value_changed(value: float) -> void:
	$AudioStreamPlayer.volume_db = linear_to_db(value)
	print("Итог ", $AudioStreamPlayer.volume_db)
