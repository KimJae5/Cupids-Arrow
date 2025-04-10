extends Control

var score = 0  # Initialize score

# Reference to the ScoreLabel node (adjust path if needed)
@onready var score_label = $ScoreLabel  # Ensure this matches your scene structure

# Called when the game starts
func _ready():
	print("Game Started")
	update_score_display()
	print(score_label)  # Debugging: Check if the reference is valid
	
# Function to handle when an enemy is destroyed or any event that changes the score
func enemy_destroyed():
	score += 100  # Increase the score by 100 points (you can adjust this as needed)
	update_score_display()  # Update the score display to reflect the new score

# Function to update the score display on the screen
func update_score_display():
	if score_label:  # Ensure the score_label reference is valid
		score_label.text = "Score: " + str(score)  # Update the text of the label with the new score
	else:
		print("Error: ScoreLabel node not found!")
		
func _process(delta):
	if Input.is_action_pressed("ui_accept"):  # Simulate score update when the "Enter" key is presse
		enemy_destroyed()  # Call the function to update the score
