# Maintainer: Muhammad Asif Rauf <your_email@example.com>
pkgname=plasmasys
pkgver=1.0
pkgrel=1
pkgdesc="A simple Python sensor monitor for the KDE Plasma 6 desktop."
arch=('any')
url="https://github.com/asif54800-spec/plasmasys"
license=('MIT')
depends=('python' 'python-psutil' 'python-pyqt6')
makedepends=()
optdepends=('wireless_tools: for displaying Wi-Fi SSID')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/plasmasys"
    install -Dm755 "plasmasys.py" "$pkgdir/usr/bin/plasmasys"
    install -Dm644 "plasmasys.desktop" "$pkgdir/usr/share/applications/plasmasys.desktop"
    install -Dm644 "plasmasys.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/plasmasys.svg"
    install -Dm644 "plasmasys.svg" "$pkgdir/usr/share/icons/plasmasys.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


