extends Area2D

@export var speed := 300
var direction := Vector2.ZERO

@onready var animated_sprite = $AnimatedSprite2D

@export var ExplosionScene = preload("res://explotion.tscn")

func _ready():
	animated_sprite.play("fireball")
	$SFXLaunch.play()
	self.body_entered.connect(_on_body_entered) # Perbaikan Godot 4

func _process(delta):
	position += direction * speed * delta
	rotation = direction.angle()

func _on_body_entered(body):
	if body.is_in_group("enemy"): # Pastikan musuh masuk group "enemy"
		# Tampilkan animasi ledakan
		var explosion = ExplosionScene.instantiate()
		explosion.position = position
		get_tree().current_scene.add_child(explosion)

		# Benar:
		var anim = explosion.get_node("AnimatedSprite2D")
		anim.play("fireball") # Pastikan nama animasi benar

		# SFX
		var sfx = AudioStreamPlayer2D.new()
		sfx.stream = $SFXLaunch.stream
		sfx.position = position
		get_tree().current_scene.add_child(sfx)
		sfx.play()
		sfx.finished.connect(sfx.queue_free)
		
		queue_free() # Hancurkan fireball
		body.queue_free() # (opsional) Hancurkan musuh
