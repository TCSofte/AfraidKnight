extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Sprite.value = $YSort/knight.life


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("$YSort/knight.life",$YSort/knight.life)
	print("$CanvasLayer/Sprite.value",$CanvasLayer/Sprite.value)
	$CanvasLayer/Sprite.value = $YSort/knight.life
	


func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		print("spawn camera")
		$CanvasModulate.visible = true
		$knight/Light2D.visible = true
	


