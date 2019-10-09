pkgname=kbd75-udev
pkgver=1
pkgrel=1
pkgdesc="udev rules for KBDFans kbd75 keyboard programming"
arch=('any')
url="https://kbdfans.com/"
license=('custom')
source=('99-kbd75.rules')
sha256sums=('e4ba75038cd972e9d76717bfb396e8cfa3d0f33b35e0ab14cefa4699fd3e6125')

package() {
    rulesdir="$pkgdir/usr/lib/udev/rules.d"
    mkdir -p $rulesdir
    cp "99-kbd75.rules" $rulesdir
}
