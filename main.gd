extends Node

var clicks: int
var time_elapsed: float = 0.0
@onready var label: Label = $CanvasLayer/Label
@onready var button_label: Label = $CanvasLayer/VBoxContainer/Label

func _ready() -> void:
	var dict: Dictionary = SaveManager.load_game()
	clicks = dict["clicks"]
	time_elapsed = dict["time_elapsed"]

func _process(delta: float) -> void:
	time_elapsed += delta
	update_button_presses(clicks)
	update_time_elapsed(time_elapsed)

func update_time_elapsed(time: float) -> void:
	label.text = "Time elapsed: " + str(snapped(time, 0.1)) + "s"

func update_button_presses(presses: int) -> void:
	button_label.text = "Button presses: " + str(presses)


func _on_button_pressed() -> void:
	clicks += 1

func _exit_tree() -> void:
	SaveManager.save_game({"clicks" : clicks, "time_elapsed": time_elapsed})
