# Maintainer: Leandro Kollenberger <lkollenberger at frba.utn.edu.ar>:wq
pkgname=nmap-vulners
pkgver='1.0'
pkgrel=1
pkgdesc="NSE script using some well-known service to provide info on vulnerabilities"
arch=(any)
depends=(nmap)
source=("https://github.com/vulnersCom/nmap-vulners/archive/v1.0-release.tar.gz")
md5sums=('c081ddfc9858b89e610e25cbce9e5347')

package() {
	install -Dm644 $srcdir/$pkgname-$pkgver-release/vulners.nse "$pkgdir"/usr/share/nmap/scripts/vulners.nse
}
