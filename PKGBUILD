# Maintiner: Alexnadria Pettit <alxpettit@gmail.com>

pkgname=pubip
pkgver=1.0
pkgrel=1
pkgdesc="View your public IP through a number of means"
arch=('any')
url="https://github.com/alxpettit/pubip"
license=('GPL')
depends=('bind-tools' 'curl')
makedepends=('git')
provides=('pubip')
conflicts=('pubip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
  #install -D -m755 $pkgname.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
}

