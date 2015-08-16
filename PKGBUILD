# Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw-w64-glm
pkgver=0.9.x
pkgrel=2
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification. (mingw-w64 symlinks)"
arch=('any')
license=('GPL')
url="http://glm.g-truc.net"
depends=('glm' 'mingw-w64-crt')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
  	mkdir -p "${pkgdir}/usr/${_arch}/include"
  	ln -s ../../../usr/include/glm "${pkgdir}/usr/${_arch}/include"
  done
}
