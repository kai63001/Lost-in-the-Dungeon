extends Control

onready var paper = $CanvasLayer/RichTextLabel

func text(data):
	paper.text = data.to_upper()
