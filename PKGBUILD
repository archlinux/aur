# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('b1fb30c6d7d24c9861a56e18c7cc3fcf650b13fabf465ae115d3842bb0c8956a')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite)
