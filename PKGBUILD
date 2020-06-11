# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('db1f662b689d6a184b215816cc6c0a04c7c8e35941692ffbda3f1837e8bdb9c8')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
}

depends=(libxtst glu libxcursor libxinerama libxft libxrandr)
