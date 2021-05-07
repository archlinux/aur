# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('a54c02041a3632e508457f73fbd81de77d1610f1639cd15b308944e0b5dc53c6')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
    install -vDm755 "weylus.desktop" "${pkgdir}/usr/share/applications/weylus.desktop"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libva gst-plugins-base-libs dbus)
