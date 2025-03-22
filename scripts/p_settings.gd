extends Panel

# Список разрешений
var resolutions = [
	[1920, 1080],
	[1280, 720],
	[800, 600]
]
# Список режимов экрана
var screen_mode = [
	["Оконный режим", 0],
	["Полноэкранный режим", 3],
	["Эксклюзивный полноэкранный режим", 4]
]

func _on_ready() -> void:
# Заполняем разрешение экрана
	var option_button = $VBC_Settings/OptionButton
	for res in resolutions:
		option_button.add_item("%dx%d" % [res[0], res[1]])
# Заполняем режим экрана
	var option_button2 = $VBC_Settings/OptionButton2
	for mode in screen_mode:
		option_button2.add_item("%s" % mode[0])
	# Подключаем сигналы
	option_button.item_selected.connect(_on_resolution_selected)
	option_button2.item_selected.connect(_on_screen_mode_selected)

func _on_screen_mode_selected(index: int):
	# Получаем выбранный режим экрана
	var screen_mode_selected = screen_mode[index][1]
	# Устанавливаем режим экрана
	DisplayServer.window_set_mode(screen_mode_selected)
 
func _on_resolution_selected(index: int):
	# Получаем выбранное разрешение
	var selected_resolution = resolutions[index]
	# Устанавливаем размер окна
	DisplayServer.window_set_size(Vector2i(selected_resolution[0], selected_resolution[1]))
