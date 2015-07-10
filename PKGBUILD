# Maintainer: anekos <anekos@snca.net>
pkgname=happy-hacking-linux
pkgver=1.0.0
pkgrel=5
pkgdesc="Happy Hacking Linux without mice. ATTENTION!! Your sensitve mice knock down your computer."
url="http://snca.net/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('bash')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()

source=('https://raw.github.com/anekos/happy-hacking-linux/master/source/happy-hacking-linux' 'https://raw.github.com/anekos/happy-hacking-linux/master/package/arch-linux/happy-hacking-linux.service')
md5sums=('b7f313555d9345a1bafb442ef78dc916' '4b80abf365a11e031074cff8fd023e7e')

package () {
  cd $srcdir

  install -d -m755 ${pkgdir}/usr/bin
  cp happy-hacking-linux ${pkgdir}/usr/bin/

  install -Dm644 "happy-hacking-linux.service" "$pkgdir/lib/systemd/system/happy-hacking-linux.service"
}

# vim:set ts=2 sw=2 et:
