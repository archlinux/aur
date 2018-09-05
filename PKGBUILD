# Maintainer: xausky <xausky@163.com>
pkgname=gsnova-bin
pkgver=0.34.0
pkgrel=1
pkgdesc="Private Proxy Solution & Network Troubleshooting Tool."
arch=('x86_64')
url="https://github.com/yinqiwen/gsnova"
license=('BSD')
backup=("opt/$pkgname/client.json")
source=("https://github.com/yinqiwen/gsnova/releases/download/$pkgver/gsnova_linux_amd64-$pkgver.tar.bz2" 'gsnova-bin')
md5sums=('2ac56445211043b595f4bcab990d7abf'
         'efcf0abd9fe1915af870121e3e209e1a')
package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/opt/$pkgname"
	install "gsnova-bin" "$pkgdir/usr/bin"
	install "client.json" "$pkgdir/opt/$pkgname"
	install "cnipset.txt" "$pkgdir/opt/$pkgname"
	install "gsnova" "$pkgdir/opt/$pkgname"
	install "hosts.json" "$pkgdir/opt/$pkgname"
	install "server.json" "$pkgdir/opt/$pkgname"
	
}

