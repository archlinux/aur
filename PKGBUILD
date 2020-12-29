# Maintainer: Sotirios M. Roussis aka. xtonousou <xtonousou@gmail.com>

pkgname=ship
pkgver=2.6
pkgrel=3
pkgdesc='Simple, handy network addressing multitool with plenty of utilities'
url='https://github.com/xtonousou/ship.git'
source=('https://raw.githubusercontent.com/xtonousou/ship/master/ship')
provides=('ship')
conflicts=('ship')
replaces=('ship')
md5sums=('SKIP')
sha256sums=('SKIP')
arch=('any')
license=('GPL3')
depends=('bash>=3.2' 'coreutils' 'gawk' 'grep' 'iproute2' 'iputils' 'mtr' 'sed' 'traceroute' 'wget')
makedepends=('binutils' 'coreutils' 'git')

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm755 ship "${pkgdir}/usr/bin/ship"
}

# vim: ts=2 sw=2 et:
