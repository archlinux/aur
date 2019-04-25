pkgname=usbasp-udev
pkgver=0.1
pkgrel=3
pkgdesc="udev rules for USBasp Atmel AVR programmer"
arch=('any')
url="http://www.fischl.de/usbasp/"
license=('custom')
source=('99-usbasp.rules'
        'LICENSE')
sha256sums=('8d4b15c72978c73242f90a02cc921219bb90b76470be3234b05b4523b1abde6c'
            '2eb312826c760ff36a34327a246323ca10e50cf026a7aaaa50467b1efe4d31bc')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-usbasp.rules" $rulesdir
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
