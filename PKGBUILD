# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=xpub
pkgver=0.1
pkgrel=1
pkgdesc='Bash script to get X user environment even from limited env.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
depends=('bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 src/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
