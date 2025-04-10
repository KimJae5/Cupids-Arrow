extends Label


var score = 0
var score_label

func _ready():
	score_label = get_parent().get_node("Label")
	score = 0

func _physics_process(_delta):
	var velocity = Vector2()
  

	# Update score and display
	score_label.text = "Score: " + str(score)
