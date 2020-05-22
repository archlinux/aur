# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL-3.0-or-later')
source=("https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('9cead1bb291507a377b5a2ee3e1c44f4cdc92f49b6984361ab79a2600c71be5b')

package() {
    install -vDm755 weylus     "$pkgdir/usr/local/bin/weylus"
}
