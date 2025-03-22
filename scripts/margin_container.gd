extends MarginContainer
var sm
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

	var ind
	if Global.ScreenMode >= 0:
		ind = Global.config.get_value("Display", "ScreenMode", Global.ScreenMode)
		print("ind1 = ", ind)
	if ind == 0:
		print("ind = ", ind)
		$P_Settings/VBC_Settings/OptionButton2.selected = 0
		sm = 0
	elif ind == 3:
		print("ind = ", ind)
		$P_Settings/VBC_Settings/OptionButton2.selected = 1
		sm = 1
	elif ind == 4:
		print("ind = ", ind)
		$P_Settings/VBC_Settings/OptionButton2.selected = 2
		sm = 2
	else:
		print("Ошибка! Неизвестное значение разрешения")
	
	

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
	
	$P_Settings/VBC_Settings/HSlider.value = 1
	print("ScreenMode = ", Global.ScreenMode)
	print("ScreenMode = ", Global.volume)
	if $P_Settings/VBC_Settings/OptionButton2.selected != Global.screen_mode[sm][1]:
		$P_Settings/VBC_Settings/OptionButton2.selected = 0
		DisplayServer.window_set_mode(0)
	else:
		pass
