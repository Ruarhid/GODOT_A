extends Node

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

# Путь к файлу настроек
const SETTINGS_PATH = "res://settings.cfg"

# Экземпляр ConfigFile
var config = ConfigFile.new()

# Переменные для хранения настроек
var volume = 1 # Пример: громкость
var ScreenMode = 4  # Пример: полноэкранный режим

func _ready():

	load_settings()  # Загружаем настройки при старте
	apply_settings()  # Применяем настройки

# Функция загрузки настроек
func load_settings():
	# Проверяем, существует ли файл
	if config.load(SETTINGS_PATH) != OK:
		# Если файла нет, создаём с настройками по умолчанию
		set_default_settings()
		print("Файл конфигурации отсутсвует! Восстановление настроек")
		save_settings()
		return
	
	# Загружаем значения из файла
	volume = config.get_value("Audio", "volume", 1.0)  # 1.0 — значение по умолчанию
	ScreenMode = config.get_value("Display", "ScreenMode", 0) # 0 — значение по умолчанию

# Функция сохранения настроек
func save_settings():
	# Записываем значения в секции
	print("window_get_mode ", DisplayServer.window_get_mode())
	print("Global.ScreenMode ", Global.ScreenMode)
	config.set_value("Audio", "volume", volume)
	config.set_value("Display", "ScreenMode", ScreenMode)
	
	# Сохраняем файл
	var err = config.save(SETTINGS_PATH)
	if err != OK:
		print("Ошибка при сохранении настроек: ", err)

# Установка настроек по умолчанию
func set_default_settings():
	volume = 1.0
	ScreenMode = 3

# Применение настроек к игре
func apply_settings():
	DisplayServer.window_set_mode(ScreenMode)
	print("window_get_mode ", DisplayServer.window_get_mode())
	print("Global.ScreenMode ", Global.ScreenMode)
