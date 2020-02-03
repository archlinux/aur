# Maintainer: gee

pkgname=reshade-shaders-git
pkgver=1
pkgrel=1
pkgdesc='A collection of post-processing shaders written in the ReShade FX shader language'
arch=('any')
url='https://github.com/crosire/reshade-shaders'
license=('custom')
source=("git+https://github.com/crosire/reshade-shaders.git")
sha256sums=(SKIP)

package() {
  cd ${srcdir}/reshade-shaders

  install -dm 755 "${pkgdir}/usr/share/reshade/shaders"
  install -Dm 644 Shaders/*.*  "${pkgdir}/usr/share/reshade/shaders/"
  install -dm 755 "${pkgdir}/usr/share/reshade/textures"
  install -Dm 644 Textures/*.* "${pkgdir}/usr/share/reshade/textures/"
}
