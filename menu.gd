extends Control


func _on_ready() -> void:
	$MarginContainer/P_Settings.visible = false
	$MarginContainer/P_Main.visible = true
	print("START")

func _on_play_pressed() -> void:
	pass # Replace with function body.

func _on_settings_pressed() -> void:
	$MarginContainer/P_Main.visible = false
	$MarginContainer/P_Settings.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_about_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	$MarginContainer/P_Main.visible = true
	$MarginContainer/P_Settings.visible = false


func _on_audio_stream_player_ready() -> void:
	$AudioStreamPlayer.play()
