extends Node2D

@export var character_size: Vector2i = Vector2i(20,20)
@export var move_speed: int = 100

@onready var sprite: Sprite2D = $Sprite2D
@onready var _MainWindow: Window = get_window()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var mouse_pos = get_viewport().get_mouse_position()
	var mouse_pos = get_global_mouse_position()
	#var mouse_pos = DisplayServer.mouse_get_position()
	#print(mouse_pos)
	
	var sdirection = sprite.position.direction_to(mouse_pos)
	print(sdirection)
	var send_pos_x = move_speed * delta * sdirection.x
	#send_pos_x = clamp(send_pos_x, 0,_MainWindow.size.x - character_size.x)
	var send_pos_y = move_speed * delta * sdirection.y
	#send_pos_y = clamp(send_pos_y, 0, _MainWindow.size.y - character_size.y)
	var send_pos = sprite.position + Vector2(send_pos_x, send_pos_y)
	send_pos.x = clamp(send_pos.x, 0, _MainWindow.size.x - character_size.x)
	send_pos.y = clamp(send_pos.y, 0, _MainWindow.size.y - character_size.y)
	#print(send_pos)
	sprite.position = send_pos
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
