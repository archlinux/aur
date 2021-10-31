# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.11.4
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('8f0a640d37a8aa451eef5831c513c6ebae6cb411170208ef028678ba4b8a99f2')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
    install -vDm755 "weylus.desktop" "${pkgdir}/usr/share/applications/weylus.desktop"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libva gst-plugins-base-libs dbus)
optdepends=("gst-plugin-pipewire: Wayland support")
