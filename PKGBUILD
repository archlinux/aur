# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>

pkgname=usbtinyisp-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for USBtinyISP AVR programmer"
arch=('any')
url="https://learn.adafruit.com/usbtinyisp"
license=('custom')
source=('99-usbtinyisp.rules'
        'LICENSE')
sha256sums=('70fd3ed65781f3847cd8ab35c21886e0f90be10636323bd391973dbab022394b'
            '0303377741aec6564114a165d8c04a1a8d4975679875bd668c53fde529bedc83')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-usbtinyisp.rules" $rulesdir
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
