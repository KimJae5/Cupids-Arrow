extends Node2D

var score = 0
@onready var score_label = $HUD/ScoreLabel

func increase_score(amount):   
	print("This Main instance:", self)
	print("Adding score:", amount)
	score += amount
	update_score_display()

func _ready(): 
	update_score_display()

func update_score_display():
	if score_label:
		score_label.text = "Score: " + str(score)
		print("Score updated:", score_label.text)
	else:
		print("ScoreLabel is null or not found")
