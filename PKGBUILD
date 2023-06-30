# Maintainer: awumii <awumii@protonmail.com>

pkgname=wpc-bin
pkgver=1.8.0
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from Wallhaven and Reddit (binary release)'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
source=("https://github.com/jkotra/wpc/releases/download/${pkgver}/wpc_${pkgver}_linux.tar.xz")
sha256sums=('c6498416ef7e425e359fdfe7a3111a37049103c2196bf9ce6250868e67dc2419')

package() {
    install -Dm0755 "wpc" -t "$pkgdir/usr/bin/"
}
