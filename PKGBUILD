# Maintainer: Julien Savard <juju2143@gmail.com>
pkgname=zd1201-firmware
pkgver=0.14
pkgrel=1
pkgdesc="Non-free firmware for zd1201 devices."
url="http://linux-lc100020.sourceforge.net"
arch=('any')
license=('unknown')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://prdownloads.sourceforge.net/linux-lc100020/zd1201-${pkgver}-fw.tar.gz")
md5sums=('07a4febc365121f975e2c5e59791d55d')

package() {
  cd "${srcdir}/zd1201-${pkgver}-fw"
  install -d -m755 "$pkgdir/usr/lib/firmware/"
  install -D -m644 *fw "$pkgdir/usr/lib/firmware/"
  install -D -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
