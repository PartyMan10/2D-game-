extends Control

func _ready():
	# Use Callable instead of (self, "method_name")
	$Play.connect("pressed", Callable(self, "_on_Play_pressed"))
	$Quit.connect("pressed", Callable(self, "_on_Quit_pressed"))

func _on_Play_pressed():
	# Replace with your actual game scene path
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()
