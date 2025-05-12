precision mediump float;

varying vec2 v_vTexcoord;
uniform float u_time;

void main() {
    float stripe = mod((v_vTexcoord.x + v_vTexcoord.y + u_time * 0.1) * 10.0, 1.0);
    float brightness = 0.15 + 0.1 * step(0.5, stripe); // two-tone
    gl_FragColor = vec4(vec3(brightness), 1.0);
}
