extends Node2D # Ganti dengan CharacterBody2D/RigidBody2D jika Anda menggunakan PhysicsBody

@export var movement_speed: float = 150.0 # Kecepatan bergerak (pixel per detik)

var target_position: Vector2 = Vector2.ZERO # Posisi tujuan yang akan dituju
var is_moving: bool = false # Untuk melacak apakah sprite sedang bergerak

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D # Asumsi AnimatedSprite2D adalah child

func _ready():
    # Inisialisasi posisi target di posisi awal sprite
    target_position = global_position
    update_animation() # Atur animasi awal (misalnya "idle")

func _process(delta):
    if is_moving:
        move_to_target(delta)
    else:
        update_animation() # Pastikan animasi idle saat tidak bergerak

func _input(event):
    # Mendeteksi klik kanan mouse (MouseButton.RIGHT = 2)
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
        target_position = get_global_mouse_position() # Dapatkan posisi klik di dunia
        is_moving = true
        update_animation() # Ubah animasi menjadi berjalan

func move_to_target(delta):
    # Hitung arah ke target
    var direction = (target_position - global_position).normalized()

    # Hitung jarak ke target
    var distance = global_position.distance_to(target_position)

    # Jika jarak sangat dekat, hentikan pergerakan
    if distance < (movement_speed * delta): # Gunakan threshold kecil
        global_position = target_position
        is_moving = false
        update_animation() # Ubah animasi menjadi idle
    else:
        # Pindahkan sprite
        global_position += direction * movement_speed * delta

        # Update arah sprite (optional, untuk membalik sprite)
        if direction.x > 0:
            animated_sprite.flip_h = false # Menghadap kanan
        elif direction.x < 0:
            animated_sprite.flip_h = true # Menghadap kiri

func update_animation():
    if is_moving:
        # Asumsi Anda punya animasi bernama "run" atau "walk"
        if animated_sprite.animation != "run":
            animated_sprite.play("run")
    else:
        # Asumsi Anda punya animasi bernama "idle"
        if animated_sprite.animation != "idle":
            animated_sprite.play("idle")