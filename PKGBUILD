# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('a5c8931a6ab79eb910275492ed967a3086979e939c6eae096179eedfb5326810')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
}

depends=(libxtst glu libxcursor libxinerama libxft libxrandr)
