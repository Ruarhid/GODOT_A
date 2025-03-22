extends Control

func _on_ready() -> void:
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.volume_linear = $MarginContainer/P_Settings/VBC_Settings/HSlider.value

func _on_audio_stream_player_ready() -> void:
	$AudioStreamPlayer.play()

func _on_h_slider_value_changed(value: float) -> void:
	$AudioStreamPlayer.volume_db = linear_to_db(value)
