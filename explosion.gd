extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var light = $PointLight2D # Pastikan nama node sesuai

func _ready():
    animated_sprite.play("explosion")
    animated_sprite.animation_finished.connect(_on_animation_finished)
    # Tween energy dari 1.0 ke 0.0 selama 0.5 detik
    var tween = create_tween()
    tween.tween_property(light, "energy", 0.0, 0.7) 

func _on_animation_finished():
    queue_free()