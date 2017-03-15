# Maintainer: Samuel Čavoj <sammko@sammserver.com>
pkgname=ctop
pkgver=0.5
pkgrel=1
pkgdesc="Top-like interface for container metrics"
depends=('glibc')
arch=('x86_64')
url="https://bcicen.github.io/ctop/"
license=('MIT')
source=("https://github.com/bcicen/ctop/releases/download/v$pkgver/ctop-$pkgver-linux-amd64"
        'LICENSE')
sha256sums=('5313c4e2f98639cce53545762f0b65f3db977ae764a9acb2fb15928713b8cde0'
            'dddd1fa1661d597b20142203d85c29c01cf18d400be06db289b26d578f81c553')

package() {
	install -Dm755 "$srcdir/ctop-$pkgver-linux-amd64" "$pkgdir/usr/bin/ctop"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

