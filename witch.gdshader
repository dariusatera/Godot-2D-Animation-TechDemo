shader_type canvas_item;

void fragment() {
    vec2 uv = (UV - vec2(0.5)) * vec2(2.0, 1.0); // pipihkan di sumbu Y
    float shadow = 1.0 - smoothstep(0.15, 0.45, length(uv));
    COLOR = vec4(0.0, 0.0, 0.0, shadow * 0.4); // 0.4 = transparansi bayangan
}
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
