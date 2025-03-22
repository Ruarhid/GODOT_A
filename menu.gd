extends Control




# Список разрешений
var resolutions = [
	[1920, 1080],
	[1280, 720],
	[800, 600]
]

var screen_mode = [
	["Оконный режим", 0],
	["Полноэкранный режим", 3],
	["Эксклюзивный полноэкранный режим", 4]
]



func _on_ready() -> void:
	
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.volume_linear = $MarginContainer/P_Settings/VBoxContainer/HSlider.value
	$MarginContainer/P_Settings.visible = false
	$MarginContainer/P_Main.visible = true
	
	
	
	var option_button2 = $MarginContainer/P_Settings/VBoxContainer/OptionButton2
	for mode in screen_mode:
		option_button2.add_item("%s" % mode[0])
		


# Заполняем OptionButton
	var option_button = $MarginContainer/P_Settings/VBoxContainer/OptionButton
	for res in resolutions:
		option_button.add_item("%dx%d" % [res[0], res[1]])
	
	# Подключаем сигнал
	option_button.item_selected.connect(_on_resolution_selected)
	option_button2.item_selected.connect(_on_screen_mode_selected)


func _on_screen_mode_selected(index: int):
	var screen_mode_selected = screen_mode[index][1]
	DisplayServer.window_set_mode(screen_mode_selected)
 



func _on_resolution_selected(index: int):
	# Получаем выбранное разрешение
	var selected_resolution = resolutions[index]
	
	# Устанавливаем размер окна
	DisplayServer.window_set_size(Vector2i(selected_resolution[0], selected_resolution[1]))
	



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


func _on_h_slider_value_changed(value: float) -> void:
	$AudioStreamPlayer.volume_db = linear_to_db(value)
