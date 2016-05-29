# Maintainer: ajswis <bs.of.dth@gmail.com>

pkgname=slim-theme-arch-triforce
pkgver=1.0
pkgrel=1
pkgdesc='Zelda based SLiM theme'
license=('GPL')
arch=('any')
url="https://github.com/ajswis/${pkgname}"
depends=('slim')
makedepends=()
source=("git://github.com/ajswis/${pkgname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"

  curl -O "https://s3.amazonaws.com/ajswis-images/slim-theme-arch-triforce/background.png"
  curl -O "https://s3.amazonaws.com/ajswis-images/slim-theme-arch-triforce/panel.png"

  install -d "${pkgdir}/usr/share/slim/themes/${pkgname}"
  install -m 644 background.png panel.png slim.theme "${pkgdir}/usr/share/slim/themes/${pkgname}"
}
