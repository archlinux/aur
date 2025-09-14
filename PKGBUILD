pkgname=foamshot-bin
pkgver=v0.2.7
pkgrel=1
pkgdesc="foamshot is wayland screenshot utility build by rust"
arch=('x86_64')
url="https://github.com/Thirdwinter/foamshot"
license=('MIT')
depends=('wl-clipboard')
source=("https://github.com/Thirdwinter/foamshot/releases/download/$pkgver/foamshot_$pkgver")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/foamshot_$pkgver" "$pkgdir/usr/bin/foamshot"
}
