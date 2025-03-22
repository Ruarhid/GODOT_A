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

func _on_b_save_pressed() -> void:
	Global.config.set_value("Audio", "volume", $P_Settings/VBC_Settings/HSlider.value)
	
	var ind
	var val
	if $P_Settings/VBC_Settings/OptionButton2.selected >= 0:
		ind = $P_Settings/VBC_Settings/OptionButton2.selected
	if ind == 0:
		val = 0
		Global.config.set_value("Display", "ScreenMode", val)
	elif ind ==  1:
		val = 3
		Global.config.set_value("Display", "ScreenMode", val)
	elif ind == 2:
		val = 4
		Global.config.set_value("Display", "ScreenMode", val)
	else:
		print("Ошибка! Неизвестное значение разрешения")
		
	
	Global.config.save(Global.SETTINGS_PATH)

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_b_default_pressed() -> void:
	Global.set_default_settings()
	#$P_Settings/VBC_Settings/HSlider.value_changed = Global.volume
	$P_Settings/VBC_Settings/OptionButton2.selected = Global.ScreenMode
	
