# Maintainer: xausky <xausky@163.com>
pkgname=gsnova-bin
pkgver=0.34.0
pkgrel=2
pkgdesc="Private Proxy Solution & Network Troubleshooting Tool."
arch=('x86_64')
url="https://github.com/yinqiwen/gsnova"
license=('BSD')
backup=("opt/$pkgname/client.json")
source=("https://github.com/yinqiwen/gsnova/releases/download/$pkgver/gsnova_linux_amd64-$pkgver.tar.bz2" 'gsnova-bin' 'gsnova-bin.desktop' 'ic_launcher.png')
package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/share/applications"
	install "gsnova-bin" "$pkgdir/usr/bin"
	install "client.json" "$pkgdir/opt/$pkgname"
	install "cnipset.txt" "$pkgdir/opt/$pkgname"
	install "gsnova" "$pkgdir/opt/$pkgname"
	install "hosts.json" "$pkgdir/opt/$pkgname"
	install "server.json" "$pkgdir/opt/$pkgname"
	install "ic_launcher.png" "$pkgdir/opt/$pkgname"
	install "gsnova-bin.desktop" "$pkgdir/usr/share/applications"
}
md5sums=('2ac56445211043b595f4bcab990d7abf'
         'efcf0abd9fe1915af870121e3e209e1a'
         '900764849fef642d922b73cab2c1a724'
         '035eca5776ea3b108463709387f2c759')
