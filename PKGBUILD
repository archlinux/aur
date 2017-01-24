# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=dot-git
pkgver=0.1
pkgrel=1
pkgdesc='Dot.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
depends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/Ventto/lux/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
}
