# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=archlinuxmx-keyring
pkgver=20210427
pkgrel=1
pkgdesc='Arch Linux MX PGP keyring'
arch=(any)
url='https://github.com/archlinuxmx/archlinuxmx-keyring.git/'
license=('GPL')
install="$pkgname.install"
source=("https://github.com/archlinuxmx/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8b8eef7cff463120ba474c8a0cae2c0f05a7acd312fec21d708d30d6820ceea4')
validpgpkeys=('903BAB73640EB6D65533EFF3468F122CE8162295') # Santiago Torres-Arias <santiago@archlinux.org>

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
