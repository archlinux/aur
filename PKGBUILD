# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.6.2
pkgrel=2
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('c43197b01d7a19b72c27245d466b28e676a1091e2515499d4bcd8d4624640009')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
}

depends=(libxtst glu libxcursor libxinerama libxft)
