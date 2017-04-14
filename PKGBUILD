# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-update'
pkgver=1.0
pkgrel=1
pkgdesc='A pass extension that provides a convenient solution to update an existing password.'
arch=('any')
url='https://github.com/roddhjav/pass-update'
license=('GPL3')
depends=('pass')
source=(https://github.com/roddhjav/pass-update/archive/v${pkgver}.tar.gz)
sha512sums=('6a4918ba6506abfbe088d81a4ed00ebcafdddea0b8b6b4f55438ea349c7e6a4a7b8dfb603d0fcde44e4255a694fc9f0e54e5243b8286036bd6ea5a7ea1a9770a')

package() {
  cd "${srcdir}/pass-update-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
