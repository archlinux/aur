# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.6.1
pkgrel=2
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('e58133f11dd14adbdefb586cdb456f732c977f96d3d7e5fa1b8783dfa0ad5c1e')

package() {
    install -vDm755 weylus     "$pkgdir/usr/bin/weylus"
}

depends=(libxtst glu libxcursor libxinerama libxft)
