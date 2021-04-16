# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('0f3fc5c4b71278eba093750ce44037d30c57599dc4bdb58972223c40919db53d')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
    install -vDm755 "weylus.desktop" "${pkgdir}/usr/share/applications/weylus.desktop"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libva gst-plugins-base-libs dbus)
