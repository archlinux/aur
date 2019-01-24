# Maintainer: Samuel Čavoj <sammko@sammserver.com>
pkgname=ctop-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Top-like interface for container metrics"
depends=('glibc')
provides=('ctop')
conflicts=('ctop')
arch=('x86_64')
url="https://bcicen.github.io/ctop/"
license=('MIT')
source=("https://github.com/bcicen/ctop/releases/download/v$pkgver/ctop-$pkgver-linux-amd64"
        'LICENSE')
sha256sums=('e1af73e06f03caf0c59ac488c1cda97348871f6bb47772c31bbd314ddc494383'
            'dddd1fa1661d597b20142203d85c29c01cf18d400be06db289b26d578f81c553')

package() {
	install -Dm755 "$srcdir/ctop-$pkgver-linux-amd64" "$pkgdir/usr/bin/ctop"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
