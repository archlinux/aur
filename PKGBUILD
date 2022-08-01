# Maintainer: Mugr Rex <mugr AT disroot.org>

pkgname=evmosd-bin
pkgver=6.0.3
pkgrel=1
pkgdesc="Evmos Daemon"
arch=('x86_64')
url="https://evmos.org"
license=("Apache-2.0")
source=("https://github.com/evmos/evmos/releases/download/v${pkgver}/evmos_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=("3371b84bea1a0fbae94c5c30af73dc1dd48625e8fbdf1edd19ba54f6a79f9632")

package() {
	install -d $pkgdir/usr/bin
	install $srcdir/bin/evmosd $pkgdir/usr/bin/ 
}
