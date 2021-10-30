# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('51dc2d772594f2c4bda0228bb1ea22ae2a4a889390d7d6ba409ee606915ca27f')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
    install -vDm755 "weylus.desktop" "${pkgdir}/usr/share/applications/weylus.desktop"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libva gst-plugins-base-libs dbus)
optdepends=("gst-plugin-pipewire: Wayland support")
