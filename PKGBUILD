pkgname=fairphone-udev
pkgver=0.2
pkgrel=1
pkgdesc="udev rules for Fairphone 1 and 2."
arch=('any')
url="http://www.fairphone.com/"
license=('MIT')
source=('99-fairphone.rules')
sha256sums=('e4e68bd53bb4b35bd7bb2ae93f485588405896a42ccb5b9f26f1a57302fe14bc')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-fairphone.rules" $rulesdir
}
