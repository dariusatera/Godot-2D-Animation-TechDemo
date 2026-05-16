extends Node2D 

class_name Witch

# Posisi tujuan saat klik kanan
var target_position: Vector2
# Status apakah node sedang bergerak
var is_moving := false
# Kecepatan gerak node (pixel per detik)
var movement_speed := 200

@onready var animated_sprite = $AnimatedSprite2D # untuk mengakses AnimatedSprite2D
@onready var spawn_timer = Timer.new()

var FireballScene = preload("res://fireball.tscn") # pastikan path benar
var EnemyScene = preload("res://enemy.tscn") # pastikan path benar

func _ready():
	randomize()
	spawn_enemy_near_witch(5) # spawn 5 musuh di dekat penyihir
	add_child(spawn_timer)
	spawn_timer.wait_time = 2.0
	spawn_timer.one_shot = false
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.start()

func spawn_enemy_random(jumlah: int):
	var ukuran_layar = get_viewport_rect().size
	for i in jumlah:
		var pos_random = Vector2(
			randf_range(0, ukuran_layar.x),
			randf_range(0, ukuran_layar.y)
		)
		var enemy = EnemyScene.instantiate()
		enemy.position = pos_random
		get_tree().current_scene.call_deferred("add_child", enemy) # <-- gunakan call_deferred

func spawn_enemy_near_witch(jumlah: int): # Spawn musuh di sekitar penyihir
	var radius_min = 100
	var radius_max = 200
	for i in jumlah:
		var angle = randf_range(0, TAU)
		var distance = randf_range(radius_min, radius_max)
		var pos_random = position + Vector2(cos(angle), sin(angle)) * distance
		var enemy = EnemyScene.instantiate()
		enemy.position = pos_random
		# Tambahkan offset acak agar target musuh tidak sama persis
		var offset = Vector2(randf_range(-32, 32), randf_range(-32, 32))
		enemy.target_offset = offset
		enemy.witch_ref = self # Kirim referensi Witch
		get_tree().current_scene.call_deferred("add_child", enemy)

func _input(event):
	# Jika klik kanan ditekan
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			# Simpan posisi mouse sebagai target
			target_position = get_global_mouse_position()
			# Aktifkan status bergerak
			is_moving = true
		elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot_fireball(get_global_mouse_position())

func _process(delta): 
	# Jika sedang bergerak
	if is_moving:
		# Hitung arah ke target
		var direction = (target_position - position).normalized()
		# Hitung jarak ke target
		var distance = position.distance_to(target_position)
		# Hitung langkah per frame
		var step = movement_speed * delta
		# Jika sudah dekat dengan target
		if distance <= step:
			# Langsung ke target dan berhenti
			position = target_position
			is_moving = false
		else:
			# Bergerak menuju target
			position += direction * step

			# Deteksi arah dominan
			if direction.y < -0.5 and abs(direction.x) < 0.5:
				# Lurus ke atas
				animated_sprite.play("walk_up")
				animated_sprite.flip_h = false
			elif abs(direction.y) > 0.5 and direction.y < 0:
				# Serong atas
				animated_sprite.play("walk_up_serong")
				animated_sprite.flip_h = direction.x < 0
			elif direction.y > 0.5 and abs(direction.x) < 0.5:
				# Lurus ke bawah
				animated_sprite.play("walk_down")
				animated_sprite.flip_h = false
			elif abs(direction.y) > 0.5 and direction.y > 0:
				# Serong bawah
				animated_sprite.play("walk_down_serong")
				animated_sprite.flip_h = direction.x < 0
			else:
				# Horizontal
				animated_sprite.play("walk")
				animated_sprite.flip_h = direction.x < 0
	else:
		animated_sprite.play("idle") # <-- tambahkan ini

	# Batasi posisi Witch agar tidak keluar map
	position.x = clamp(position.x, min_x, max_x)
	position.y = clamp(position.y, min_y, max_y)

func shoot_fireball(target_pos: Vector2):
	var fireball = FireballScene.instantiate()
	fireball.position = position
	var direction = (target_pos - position).normalized()
	fireball.set("direction", direction)
	get_tree().current_scene.add_child(fireball)

func _on_spawn_timer_timeout():
	spawn_enemy_near_witch(3) 

var min_x = -5000
var max_x = 5000
var min_y = -5000
var max_y = 5000
