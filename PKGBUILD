# Maintainer: Denis Sheremet <feedback-from-aur@lxlz.space>
pkgname=ovpnsplit
pkgver=0.2.0
pkgrel=1
pkgdesc="OpenVPN config file splitter for NetworkManager UI"
arch=("x86_64" "i686")
url="https://github.com/dolanor/ovpnsplit/"
license=('unknown')
source_x86_64=("$pkgname-$pkgver::https://github.com/dolanor/$pkgname/releases/download/v$pkgver/$pkgname.x64")
source_i686=("$pkgname-$pkgver::https://github.com/dolanor/$pkgname/releases/download/v$pkgver/$pkgname.386")
md5sums_x86_64=(SKIP)
md5sums_i686=(SKIP)

package() {
	install -m 755 -D "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}