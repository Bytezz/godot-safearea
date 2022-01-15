## Coded by Bytez
## https://github.com/bytezz/godot-safearea
## ----
## Safe area container
## (for Godot Game Engine).

extends MarginContainer

var viewSize
var safeArea

func _ready():
	calculate()

func calculate():
	#if ["Android", "iOS"].has(OS.get_name):
	viewSize = get_viewport().size
	safeArea = OS.get_window_safe_area()
	
	add_constant_override("margin_top", safeArea.position.y)
	add_constant_override("margin_left", safeArea.position.x)
	
	add_constant_override("margin_bottom", viewSize.y-safeArea.end.y)
	add_constant_override("margin_right", viewSize.x-safeArea.end.x)


func _on_SafeArea_resized():
	calculate()
