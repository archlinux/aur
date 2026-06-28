# Maintainer: kuba09 <kuba09 at pm dot me> 
pkgname=pwnage-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rules for Pwnage devices (currently mices only)'
arch=('any')
license=('0BSD')
source=('70-pwnage.rules')
sha512sums=('42def2acbace070b5fdb005d9dfebd449afb46a73df2888ad5a124fc4813c56ea17996589fc9a2f594d713b447961417515949ba4fa806c6fd17b0def9eb23b7')

package() {
    install -Dm644 70-pwnage.rules "$pkgdir/usr/lib/udev/rules.d/70-pwnage.rules"
}

