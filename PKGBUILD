#Maintainer: Alberto Oliveira <orkan.aos@gmail.com>
pkgname=slim-theme-arch-tetra
pkgver=1.1
pkgrel=2
pkgdesc="Minimal Arch Linux SLiM theme"
arch=('any')
url="http://github.com/AlbertoOS/slim-theme-arch-tetra"
license=('CCPL:cc-by-sa')
depends=('artwiz-fonts')
optdepends=('slim: login manager providing theme support')
source=(http://github.com/AlbertoOS/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('d708c78968900d79a763be7fd6a5e187')

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/arch-tetra

  install -m 644 -D background.png "${pkgdir}"/usr/share/slim/themes/arch-tetra/background.png
  install -m 644 -D panel.png "${pkgdir}"/usr/share/slim/themes/arch-tetra/panel.png
  install -m 644 -D slim.theme "${pkgdir}"/usr/share/slim/themes/arch-tetra/slim.theme
  install -m 644 -D preview.png "${pkgdir}"/usr/share/slim/themes/arch-tetra/preview.png
  install -m 644 -D ../README "${pkgdir}"/usr/share/slim/themes/arch-tetra/README

}

# vim:set ts=2 sw=2 et:
