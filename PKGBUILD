# Maintainer: hexchain <i at hexchain dot org>

pkgname=mdevctl
pkgver=0.61
pkgrel=1
pkgdesc="A mediated device management utility for Linux"
url="https://github.com/mdevctl/mdevctl"
arch=('any')
license=('LGPL2.1')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdevctl/mdevctl/archive/$pkgver.tar.gz")
sha256sums=('e99a22039551837b1e512d0ecf671806bcc053425fa17e032fff81d4c6b651ac')
options+=(emptydirs)

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" SBINDIR="\$(PREFIX)/bin" install
}
