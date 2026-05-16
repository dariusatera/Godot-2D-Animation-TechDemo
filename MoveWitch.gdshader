shader_type canvas_item;

void fragment() {
    vec2 uv = (UV - vec2(0.5)) * 2.0; // pusat di tengah
    float vignette = smoothstep(0, 1.8, length(uv));
    COLOR = vec4(0, 0, 0, vignette * 0.8); // 0.7 = kekuatan gelap, bisa diubah
}


//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
