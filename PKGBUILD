# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=brutex
pkgver=1.4
pkgrel=1
pkgdesc="Automatically brute force all services running on a target"
arch=(any)
url="https://github.com/1N3/BruteX"
license=('unknown')
depends=(net-snmp nmap hydra dnsenum)
makedepends=()
source=("https://github.com/1N3/BruteX/archive/master.zip")
md5sums=(56021d41ba2370723352df1f6f1722b6)

package() {
	cd "$srcdir"/BruteX-master/
        install -dm755 "$pkgdir"/usr/share/"$pkgname"
        install -dm755 "$pkgdir"/usr/bin
        cp -rf * "$pkgdir"/usr/share/"$pkgname"/
        ln -s /usr/share/"$pkgname"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
        ln -s /usr/share/"$pkgname"/"$pkgname"-massscan "$pkgdir"/usr/bin/"$pkgname"-massscan
}
