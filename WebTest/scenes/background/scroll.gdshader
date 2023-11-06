shader_type canvas_item;


uniform vec2 speed;

void fragment () {
	float _x = UV.x + TIME * speed.x + cos(TIME/5.0);
	float _y = UV.y + TIME * speed.y + sin(TIME/5.0);
	COLOR = texture(TEXTURE, vec2(_x, _y));
}