# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Fast, secure, cross-platform database management tool with Helix/Vim keybindings"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('Apache-2.0')
depends=('gtk3' 'xdotool')
provides=('gridix')
conflicts=('gridix')
source=("https://github.com/MCB-SMART-BOY/Gridix/releases/download/v${pkgver}/gridix-linux-x86_64.tar.gz"
        "gridix.desktop"
        "LICENSE::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/LICENSE")
sha256sums=('14a4eaeaba27befdb593ee31a5c03f891549045a77f2df3042d5f3c139c41935'
            'SKIP'
            'SKIP')

package() {
    cd "$srcdir"
    install -Dm755 gridix "$pkgdir/usr/bin/gridix"
    install -Dm644 gridix.desktop "$pkgdir/usr/share/applications/gridix.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
