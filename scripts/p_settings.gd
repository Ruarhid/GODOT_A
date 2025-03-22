extends Panel



func _on_ready() -> void:
	
# Заполняем разрешение экрана
	var option_button = $VBC_Settings/OptionButton
	for res in Global.resolutions:
		option_button.add_item("%dx%d" % [res[0], res[1]])
# Заполняем режим экрана
	var option_button2 = $VBC_Settings/OptionButton2
	for mode in Global.screen_mode:
		option_button2.add_item("%s" % mode[0])
	# Подключаем сигналы
	option_button.item_selected.connect(_on_resolution_selected)
	option_button2.item_selected.connect(_on_screen_mode_selected)

func _on_screen_mode_selected(index: int):
	# Получаем выбранный режим экрана
	Global.ScreenMode = Global.screen_mode[index][1]
	# Устанавливаем режим экрана
	DisplayServer.window_set_mode(Global.ScreenMode)
 
func _on_resolution_selected(index: int):
	# Получаем выбранное разрешение
	var selected_resolution = Global.resolutions[index]
	# Устанавливаем размер окна
	DisplayServer.window_set_size(Vector2i(selected_resolution[0], selected_resolution[1]))
