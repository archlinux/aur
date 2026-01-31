# Maintainer: Natal Bumann wgtray@rcklt.ch
pkgname=wgtray
pkgver=1.0.0
pkgrel=1
pkgdesc="WireGuard system tray client for easy VPN switching"
arch=('any')
url="https://github.com/0xNatal/wgtray"
license=('GPL-3.0-or-later')
depends=(
    'python-pyqt6'
    'wireguard-tools'
    'polkit'
    'qt6-svg'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d97b85b9a6d1bff998c0617bee7aa46779f90487224754771a47a5549434a95')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
