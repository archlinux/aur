pkgname=uyr
pkgver=0.1.0
pkgrel=1
pkgdesc="A silly weather app for the terminal"
arch=('x86_64')
url="https://github.com/ViggoRomrakett/uyr"
license=('GPL3')
depends=('python' 'python-requests' 'kitty' 'pipewire-pulse')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d62fec7892ac2fe68df1d81c5c37433bf41249f194f2f3c83ba3e63383890d77')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 uyr.py "$pkgdir/usr/local/share/uyr/uyr.py"
    install -Dm755 uyr.sh "$pkgdir/usr/local/bin/uyr"
    cp -r assets "$pkgdir/usr/local/share/uyr/"
}
