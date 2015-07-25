pkgname=fairphone-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for Fairphone."
arch=('any')
url="http://www.fairphone.com/"
license=('MIT')
source=('99-fairphone.rules')
sha256sums=('a2b2b7bb3f8b13b849cc7c4b724a31f1086e4d440a350c05eeaeec2b2f45e022')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-fairphone.rules" $rulesdir
}
