# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-update'
pkgver=0.2
pkgrel=1
pkgdesc='A pass extension that provides a convenient solution to update an existing password.'
arch=('any')
url='https://github.com/roddhjav/pass-update'
license=('GPL3')
depends=('pass')
source=(https://github.com/roddhjav/pass-update/archive/${pkgver}.tar.gz)
sha512sums=('a1e54e4808b140bad0324ca6a2bac0a5cf8a88ce8862ad501235273ee2fd06c69994f9edb70d06122611010b8041a61e0190768f00d3d02f2c8fa6c59f4a55b8')

package() {
  cd "${srcdir}/pass-update-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
