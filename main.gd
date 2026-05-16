@onready var tilemap = $TileMap
var generated_tiles = {}

# Ukuran tile (misal 32x32)
const TILE_SIZE = 32
# Radius area aktif (dalam tile)
const ACTIVE_RADIUS = 10

func _process(delta):
    var witch_pos = $Witch.position
    var center = Vector2i(witch_pos.x / TILE_SIZE, witch_pos.y / TILE_SIZE)
    
    for x in range(center.x - ACTIVE_RADIUS, center.x + ACTIVE_RADIUS + 1):
        for y in range(center.y - ACTIVE_RADIUS, center.y + ACTIVE_RADIUS + 1):
            var pos = Vector2i(x, y)
            if not generated_tiles.has(pos):
                # Generate tile baru (misal, tile id 0)
                tilemap.set_cell(0, pos, 0)
                generated_tiles[pos] = true

    # (Opsional) Hapus tile yang sangat jauh dari Witch
    var to_remove = []
    for pos in generated_tiles.keys():
        if pos.distance_to(center) > ACTIVE_RADIUS + 5:
            tilemap.set_cell(0, pos, -1)
            to_remove.append(pos)
    for pos in to_remove:
        generated_tiles.erase(pos)