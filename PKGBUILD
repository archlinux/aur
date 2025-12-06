# Maintainer: vadik likholetov <vadikas@gmail.com>
pkgname=kanshi-menu
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple menu to switch kanshi profiles using fzf, with waybar integration"
arch=('any')
url="https://github.com/vadika/kanshi-menu"
license=('MIT')
depends=('bash' 'kanshi' 'fzf' 'libnotify' 'xdg-terminal-exec')
optdepends=('waybar: for waybar integration')
source=("kanshi-menu.sh"
        "waybar.include")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/kanshi-menu.sh" "$pkgdir/usr/bin/kanshi-menu"
    install -Dm644 "$srcdir/waybar.include" "$pkgdir/usr/share/kanshi-menu/waybar.include"
}
