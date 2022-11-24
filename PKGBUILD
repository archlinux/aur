# Maintainer: Markus Jochim <contact-markus@mensing-jochim.de>
pkgname=gnome-backgrounds-brush-strokes
pkgver=1
pkgrel=1
pkgdesc="Brush Strokes wallpaper from GNOME 42"
arch=("any")
url="https://github.com/MJochim/gnome-backgrounds-brush-strokes"
license=("CCPL:by-sa")
source=("$pkgname-$pkgver.tar.gz::https://github.com/MJochim/gnome-backgrounds-brush-strokes/archive/v$pkgver.tar.gz")
sha256sums=('f886ed907bd1ae2d87121346ee01184057d7bdbf33171df765d01fba9b73f532')

package() {
    conflicts=('gnome-backgrounds<43')
    mkdir -p "${pkgdir}/usr/share"
    cp -a "${srcdir}/gnome-backgrounds-brush-strokes-1/backgrounds" "${pkgdir}/usr/share"
    cp -a "${srcdir}/gnome-backgrounds-brush-strokes-1/gnome-background-properties" "${pkgdir}/usr/share"
}
