# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=xkill-shortcut
pkgver=1.0.0
pkgrel=1
pkgdesc="Provides a shortcut to access xkill from the applications menu."
arch=('any')
url="https://xorg.freedesktop.org/"
license=('Custom')
depends=('xorg-xkill')
source=("$pkgname.desktop")
sha256sums=('593f82c90c0542eede854eb814a91f1b376f36f00368da6af35afa10839b83e2')

package() {

    install -Dm 755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

}
