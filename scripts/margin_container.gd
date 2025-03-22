extends MarginContainer

func _on_ready() -> void:
	$P_Settings.visible = false
	$P_Main.visible = true
	$P_About.visible = false

func _on_play_pressed() -> void: 
	pass # Replace with function body.

func _on_settings_pressed() -> void:
	$P_Settings.visible = true
	$P_Main.visible = false
	$P_About.visible = false

func _on_about_pressed() -> void:
	$P_Settings.visible = false
	$P_Main.visible = false
	$P_About.visible = true

func _on_back_pressed() -> void:
	$P_Settings.visible = false
	$P_Main.visible = true
	$P_About.visible = false
	
func _on_quit_pressed() -> void:
	get_tree().quit()
