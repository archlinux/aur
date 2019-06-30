# Maintainer: Stykers <stykers at stykers dot moe>

pkgname=sparkz
pkgver=1.0.0
pkgrel=1
pkgdesc="A high performance, modular discord bot."
arch=('any')
url="https://git.stykers.moe/scm/sparkz/sparkz.git"
license=('GPL')
depends=('python' 'python-virtualenv' 'bash')
source=('sparkz::https://git.stykers.moe/scm/sparkz/sparkz.git')
install=${pkgname}.install
md5sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/var/lib/; cp -r ${srcdir}/sparkz/ ${pkgdir}/var/lib/sparkz/
  }
