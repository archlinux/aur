# Maintainer: Frtz Qe <nextlxqt@gmail.com>

pkgname=lext-theme-narc-colors
_upstream_pkgver="a3008f8"
pkgdesc="LXQt theme: Narc-Colors, incl. palettes and wallpapers ($_upstream_pkgver)"

# root of upstream archive
_upstream_root="Narc-Colors-Theme"

# Upstream does not have clear version/release scheme
pkgver=1
pkgrel=1

arch=('any')
url="https://codeberg.org/MrReplikant/Narc-Colors-Theme"
license=('GPL-2.0')

depends=('lxqt-panel')
source=("http://lext-store.duckdns.org/aur/lext-next/lext-theme-narc-colors.txz")
sha256sums=('SKIP')  # for testing; replace with real checksum later                                                                                                                          

package() {                                                                                                                                                                                   

    install -d "$pkgdir/usr/share/lxqt/themes"
    install -d "$pkgdir/usr/share/lxqt/palettes"
    install -d "$pkgdir/usr/share/lxqt/wallpapers"

    cp -r "$srcdir"/$_upstream_root/Narc-Colors "$pkgdir"/usr/share/lxqt/themes
    cp -r "$srcdir"/$_upstream_root/palettes "$pkgdir"/usr/share/lxqt
    cp -r "$srcdir"/$_upstream_root/wallpapers "$pkgdir"/usr/share/lxqt
}
