extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		print("ccbccbcvbcvbcbvcbbvb")
		$CanvasModulate.visible = true
		$knight/Light2D.visible = true


