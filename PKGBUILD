# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('07ee6f74924ea519fd5eaab56deaba9d6b2164bd0bdc357a6b36cd61deb3f184')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite)
