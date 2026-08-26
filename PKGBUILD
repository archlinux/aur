# Maintainer: EndlessEden < endlesseden [at] deep-rose {dot} org >

pkgname=f3d-stl-thumbnailer
pkgver=0.0.9
pkgrel=1
pkgdesc="Standalone STL thumbnailer configuration for F3D (fixes KDE Dolphin integration)"
arch=('any')
url="https://f3d.app/"
license=('MIT')
depends=('f3d')
source=('stl-f3d.thumbnailer')
sha256sums=('SKIP') # Or replace with actual sha256sum of the thumbnailer file

package() {
    # Install the thumbnailer file to the global system path
    install -Dm644 "${srcdir}/stl-f3d.thumbnailer" "${pkgdir}/usr/share/thumbnailers/stl-f3d.thumbnailer"
}
