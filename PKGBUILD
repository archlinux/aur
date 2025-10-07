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
sha256sums=('e93f9a98d97b347381fe0836f993fe55bab51363ec640959f356920d5546f15b'
            '81c7020b8b9f9f6493b420ea0c91749602ddd761c47cc264ccc967355b6bf415'
            'b1666f07807acc1e1baa1f2368b1f3298be7d670205b46e64c1db052aa093a5f'
            '8f739b409796e49022ce8d96b65c3b5c004c31efba1110f1b578a2b3f7e3a03b'
            'ba93dfcc4136b9a91f329a11de9d698bdc0e6f564247ec20f0c2b9fef5532ceb'
            'aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3')
