# Maintainer: Griffin Evans <griffinevans@protonmail.com>

pkgname=adv
pkgver=1.0.0
pkgrel=1
pkgdesc="Dispenses programming aphorisms in the style of UNIX fortune"
arch=('x86_64')
url="https://github.com/griffinevans/adv"
license=('Unlicense')
conflicts=('adv')
provides=('adv')
source=("https://github.com/griffinevans/adv/releases/download/v$pkgver/adv")
md5sums=("SKIP")

package() {
  cd "${srcdir}"

  install -Dm755 adv "${pkgdir}/usr/bin/${pkgname}"
}
