# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
# Contributor: xuelingkang <xuelingkang at 163 dot com>

pkgname=dracula-colors-xfce4-terminal
pkgver=1.2
pkgrel=2
pkgdesc="Dark theme for xfce4-terminal"
arch=('any')
url="https://github.com/dracula/xfce4-terminal"
license=('MIT')
depends=('xfce4-terminal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dracula/xfce4-terminal/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b161032c3b659c6bf9808c3769c9d5613d469f3eafead2a87b258c99b058c501')

package() {
    cd "xfce4-terminal-$pkgver"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 Dracula.theme -t "$pkgdir/usr/share/xfce4/terminal/colorschemes"
}
