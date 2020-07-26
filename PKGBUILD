# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('8143b65064e5d84e9a71d60fac713177427e40a635a101c72e657667e1437127')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite glu)
