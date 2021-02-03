# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Contributor: linuxer <linuxer@artixlinux.org>

pkgname=ananicy-runit
pkgver=1
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy"
license=('BSD')
depends=('ananicy' 'runit' 'bash' 'schedtool')
makedepends=('git' 'make')
source=("ananicy.finish"
        "ananicy.run"
        "ananicy.start")
b2sums=('SKIP'
        'SKIP'
        'SKIP')
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/etc/runit/sv/ananicy"
  cp "ananicy.finish" $pkgdir/etc/runit/sv/ananicy/finish
  cp "ananicy.run" $pkgdir/etc/runit/sv/ananicy/run
  cp "ananicy.start" $pkgdir/etc/runit/sv/ananicy/start
  install=ananicy-runit.install
}
