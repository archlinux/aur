# Maintainer: Natal Bumann wgtray@rcklt.ch
pkgname=wgtray
pkgver=1.0.1
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
sha256sums=('4844a32408693d9ebc8970e36fb8c067ef2ea823c62111d0867c07297c638df0')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
