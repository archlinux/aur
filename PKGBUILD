# Maintainer: awumii <awumii@protonmail.com>

pkgname=wpc
pkgver=1.7.0
pkgrel=1
pkgdesc='Automatic Wallpaper Changer which can retrieve wallpapers from Wallhaven and Reddit (binary release)'
arch=('x86_64')
url='https://github.com/jkotra/wpc'
license=('MIT')
depends=('gnome-shell')
source=("https://github.com/jkotra/wpc/releases/download/${pkgver}/wpc_${pkgver}_linux.tar.xz")
sha256sums=('f55a2d0dd2e72b2e6ed1cfd9e31c9aac8076c54159f1d2f0d597c5618150e77e')

package() {
    install -Dm0755 "wpc" -t "$pkgdir/usr/bin/"
}
