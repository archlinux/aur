# Maintainer: bsofdth <bs.of.dth@gmail.com>

pkgname=slim-theme-arch-triforce
pkgver=1.0
pkgrel=1
pkgdesc='Zelda based SLiM theme'
license=('GPL')
arch=('any')
url="https://github.com/bsofdth/${pkgname}"
depends=('slim')
makedepends=('git')
source=("git://github.com/bsofdth/${pkgname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/share/slim/themes/${pkgname}"
  install -m 644 background.png panel.png slim.theme "${pkgdir}/usr/share/slim/themes/${pkgname}"
}
