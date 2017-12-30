# Maintainer: Leandro Kollenberger <lkollenberger at frba.utn.edu.ar>:wq
pkgname=nmap-vulners
pkgver='1.1'
pkgrel=1
pkgdesc="NSE script using some well-known service to provide info on vulnerabilities"
arch=(any)
depends=(nmap)
url="https://github.com/vulnersCom/nmap-vulners/"
source=("https://github.com/vulnersCom/nmap-vulners/archive/v1.1-release.tar.gz")
md5sums=('d236e148cc1c217cd2e5c823fbb66f5d')

package() {
	install -Dm644 $srcdir/$pkgname-$pkgver-release/vulners.nse "$pkgdir"/usr/share/nmap/scripts/vulners.nse
}
