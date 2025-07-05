pkgname=wiqr
pkgver=1.0.0
pkgrel=1
pkgdesc="Generate Wi-Fi QR codes from saved NetworkManager connections"
arch=('any')
url="https://github.com/yourusername/wiqr"
license=('MIT')
depends=('python' 'python-questionary' 'python-qrcode')
source=('wiqr')
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/wiqr" "$pkgdir/usr/bin/wiqr"
}

