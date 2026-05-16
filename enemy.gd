extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var witch_ref = null # untuk
var target_offset := Vector2.ZERO
var speed := 100

func _ready():
	animated_sprite.play("idle")
	add_to_group("enemy")

func _physics_process(delta): # fungsi untuk pergerakan musuh
	if witch_ref != null:
		var target = witch_ref.position + target_offset
		var direction = (target - position).normalized()
		var distance = position.distance_to(target)
		if distance > 2:
			velocity = direction * speed
			animated_sprite.play("walk")
		else:
			velocity = Vector2.ZERO
			animated_sprite.play("idle")
		move_and_slide()
