# Maintainer: xuelingkang <xuelingkang at 163 dot com>
pkgname=dracula-colors-xfce4-terminal
pkgver=v1.2.5
pkgrel=1
pkgdesc="convert dracula/iterm to xfce4-terminal color scheme"
arch=('any')
url="https://github.com/xuelingkang/$pkgname"
license=('MIT')
depends=('xfce4-terminal')
makedepends=('git')
source=("git+https://github.com/xuelingkang/$pkgname.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir/usr/share/xfce4/terminal/colorschemes"
    install -Dm644 *.theme "$pkgdir/usr/share/xfce4/terminal/colorschemes"
}
