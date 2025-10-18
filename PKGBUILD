#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgrel="1"
pkgver="0.2"
_name="tuxnix-sway"
pkgname="$_name"
pkgdesc='Sway configuration of tuxnix'
url='https://codeberg.org/tuxnix/tuxnix-sway'
arch=('any')
license=('GLPv2-only')
depends=('alacritty' 'archlinux-xdg-menu' 'bemenu' 'foot' 'htop' 'kdialog' 'sway' 'otf-font-awesome' 'qt6ct' 'waybar')
optdepends=('falkon: key list (mod+k)')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/tuxnix-sway')
sha512sums=('SKIP')

package() {
    cd "$srcdir/$_name"
    install -Dm644 desk-M.config "$pkgdir/etc/skel/.config/sway/config"
    install -Dm644 testdesk.config "$pkgdir/etc/skel/.config/sway/testdesk/config"
    install -Dm644 desk-M.config "$pkgdir/etc/skel/.config/sway/desk-M/config"
    install -Dm644 desk-W.config "$pkgdir/etc/skel/.config/sway/desk-W/config"
    install -Dm644 ardour.config "$pkgdir/etc/skel/.config/sway/ardour/config"
    install -Dm644 waybar.config "$pkgdir/etc/skel/.config/waybar/config"
    install -Dm644 style.css "$pkgdir/etc/skel/.config/waybar/style.css"
    install -Dm605 keys-md "$pkgdir/usr/local/bin/keys-md"
    install -Dm605 keys-html "$pkgdir/usr/local/bin/keys-html"
    install -Dm605 sway-switch "$pkgdir/usr/local/bin/sway-switch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
