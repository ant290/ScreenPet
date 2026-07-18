extends Node2D

@export var character_size: Vector2i = Vector2i(40,40)
@export var move_speed: int = 100

@onready var sprite: Sprite2D = $Sprite2D
@onready var _MainWindow: Window = get_window()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#change the size of the window
	_MainWindow.min_size = character_size
	_MainWindow.size = _MainWindow.min_size
	
	var desktop_size = DisplayServer.screen_get_size(DisplayServer.SCREEN_PRIMARY)
	_MainWindow.position = Vector2i(desktop_size.x/2, desktop_size.y/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#var mouse_pos = get_viewport().get_mouse_position()
	#var mouse_pos = get_global_mouse_position()
	var mouse_pos = DisplayServer.mouse_get_position()
	print(mouse_pos)
	print(_MainWindow.position)
	
	#var sdirection = sprite.position.direction_to(mouse_pos)
	#print(sdirection)
	#var send_pos_x = move_speed * delta * sdirection.x
	#var send_pos_y = move_speed * delta * sdirection.y
	#var send_pos = Vector2(send_pos_x, send_pos_y)
	#print(send_pos)
	#sprite.position += send_pos
	
	var window_pos = Vector2(_MainWindow.position)
	#var mouse_global_pos = mouse_pos - window_pos
	#var direction = window_pos.direction_to(mouse_global_pos)
	var direction = window_pos.direction_to(mouse_pos)
	var end_pos_x = move_speed * delta * direction.x
	var end_pos_y = move_speed * delta * direction.y
	_MainWindow.position += Vector2i(end_pos_x, end_pos_y)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
