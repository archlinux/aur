pkgname='chad_launcher-bin'
_pkgname='chad-launcher'
pkgver=0.4.2
pkgrel=2
pkgdesc='GNU/LINUX GAMING UNLEASHED!'
arch=('x86_64')
url='https://gitlab.com/Gnurur/chad_launcher'
license=('GPL3')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips)
makedepends=()
source=(
    "$_pkgname::https://notabug.org/attachments/c2ae6975-efa7-460e-805c-f952b9ecfa61"
    "${_pkgname}.desktop::https://notabug.org/johncena141/chad_launcher/raw/v0.4.2/chad_launcher.desktop"
    "${_pkgname}.svg::https://notabug.org/johncena141/chad_launcher/raw/v0.4.2/icon.svg"
)
md5sums=('58a473b0359cbbe16ef8726bedd3f08e'
         '3982c2923488557d1bc82d8fc3391b4c'
         'eb5ae7c983884713edf7954c270085a2')

package() {
    cd $srcdir
    install -Dm0755 -t "$pkgdir/usr/bin/" "chad-launcher"
    install -Dm644 chad-launcher.desktop "$pkgdir/usr/share/applications/chad-launcher.desktop"
    install -Dm644 chad-launcher.svg "$pkgdir/usr/share/pixmaps/chad-launcher.svg"
}

