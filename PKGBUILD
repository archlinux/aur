# Maintainer: awumii <awumii@protonmail.com>

pkgname=wpc-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from Wallhaven and Reddit (binary release)'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
source=("https://github.com/jkotra/wpc/releases/download/${pkgver}/wpc_${pkgver}_linux.tar.xz")
sha256sums=('ae0417c11e2bb35de023d98a9eb77b668d91481acee89a8c51d69aac11763281')

package() {
    install -Dm0755 "wpc" -t "$pkgdir/usr/bin/"
}
