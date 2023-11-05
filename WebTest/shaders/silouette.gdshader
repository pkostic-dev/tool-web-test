shader_type canvas_item;

render_mode blend_mix;
uniform vec4 modulate : source_color;
uniform bool active = false;

void fragment() {
	if (active == true) {
		COLOR = vec4(modulate.rgb, texture(TEXTURE, UV).a * modulate.a);
	}
}
