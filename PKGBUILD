# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-update'
pkgver=0.1
pkgrel=1
pkgdesc='A pass extension that provides a convenient solution to update an existing password.'
arch=('any')
url='https://github.com/roddhjav/pass-update'
license=('GPL3')
depends=('pass')
source=(https://github.com/roddhjav/pass-update/archive/${pkgver}.tar.gz)
sha512sums=('62b290d22e0868283739b8d93d98f5c425e9d9dd80f753a40a6428c3e03745c5cf6a389979c0e30bc9b291693ef817d23149d6fb00b2b3e327ecb2b74636c2a2')

package() {
  cd "${srcdir}/pass-update-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
