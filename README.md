# glsl-specular-gaussian
Computes specular power from a Gaussian microfacet distribution

# Example

```glsl
#pragma glslify: gaussSpec = require(glsl-specular-gaussian)

uniform vec3 eyePosition;
uniform vec3 lightPosition;

uniform float shininess;

varying vec3 surfacePosition;
varying vec3 surfaceNormal;

void main() {
  vec3 eyeDirection = normalize(eyePosition - surfacePosition);
  vec3 lightDirection = normalize(lightPosition - surfacePosition);
  vec3 normal = normalize(surfaceNormal);

  float power = gaussSpec(lightDirection, viewDirection, normal, shininess);

  gl_FragColor = vec4(power,power,power,1.0);
}
```

# Usage

Install with npm:

```
npm install glsl-specular-gaussian
```

Then use with [glslify](https://github.com/stackgl/glslify).

# API

```glsl
#pragma glslify: gaussSpec = require(glsl-specular-gaussian)
```

##### `float gaussSpec(vec3 lightDir, vec3 eyeDir, vec3 normal, float shininess)`
Computes the specular power in the Gaussian model

* `lightDir` is a *unit length* `vec3` pointing from the surface point toward the light
* `eyeDir` is a *unit length* `vec3` pointing from the surface point toward the camera
* `normal` is the surface normal at the sample point
* `shininess` is the size of the specular hight light.  Smaller values give a sharper spot, while larger values give a more spread out highlight

**Returns** A `float` representing the specular power

# License
(c) 2014 Mikola Lysenko. MIT License