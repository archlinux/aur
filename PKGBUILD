# Maintainer: Louise <louise.aur@mailbox.org>

pkgname=xkb-ergol
pkgver=1.0.0
pkgrel=1
pkgdesc='A Colemak-style keyboard layout for French-speaking typists and programmers.'
arch=('any')
url='https://ergol.org/'
license=('WTFPL')
depends=('xkeyboard-config')
provides=("xkb-ergol")
source=("https://github.com/Nuclear-Squid/ergol/releases/download/ergol-v1.0.0/ergol.xkb_symbols")
b2sums=('91824f0301cadca0315c8d11680d1ddfcf87b1018d9d7af2d1ade82c584385628b67063bf24abfc8ee4de11725213c8e66e4da1f5ad91bd9bc328d3f85f36ab8')

package() {
    install -Dm644 ergol.xkb_symbols "$pkgdir/usr/share/X11/xkb/symbols/ergol"
}
