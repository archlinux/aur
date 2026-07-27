# Maintainer: spiriwind <ruiting_mail@qq.com>
pkgname=quickemu-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="TUI/CLI manager for quickemu virtual machines"
arch=('x86_64')
url="https://github.com/quickemu-project/quickemu"
license=('MIT')
depends=('python' 'quickemu')
options=('!strip')
source=("quickemu-tui.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/quickemu-tui.py" "$pkgdir/usr/bin/quickemu-tui"
}
