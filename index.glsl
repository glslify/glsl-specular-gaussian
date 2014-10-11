float gaussianSpecular(
  vec3 lightDirection,
  vec3 viewDirection,
  vec3 surfaceNormal,
  float shininess) {

  vec3 H = normalize(lightDirection + viewDirection);
  float theta = acos(dot(H, surfaceNormal));
  float w = theta / shininess;

  return exp(-w*w)
}

#pragma glslify: export(gaussianSpecular)