#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>


pkgrel=1
pkgver=0.0.1
_name="tuxnix-sway"
pkgname="$_name"
pkgdesc="Sway configuration of tuxnix"
url="https://codeberg.org/tuxnix/$pkgname"
arch=('any')
license=('GLPv2-only')
depends=( 'alacritty' 'bemenu' 'foot' 'sway' 'qt6ct' 'waybar' )
makedepends=('git')
source=("git+https://codeberg.org/tuxnix/$pkgname")
sha512sums=('SKIP')

#url="https://codeberg.org/tuxnix/$pkgname.git"


package() {
    cd "$srcdir"
    install -Dm644 sway.config "$pkgdir/etc/skel/.config/sway/config"
    install -Dm644 waybar.config "$pkgdir/etc/skel/.config/waybar/config"
    install -Dm644 style.css "$pkgdir/etc/skel/.config/waybar/style.css"
    install -Dm644 dark-archlinux.png "$pkgdir/usr/share/backgrounds/arch/dark-archlinux.png"
    install -Dm605 keybindings-md.sh "$pkgdir/usr/local/bin/keybindings-md.sh"
    install -Dm605 keybindings-html.sh "$pkgdir/usr/local/bin/keybindings-html.sh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
