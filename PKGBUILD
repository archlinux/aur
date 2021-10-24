pkgname=usbasp-udev
pkgver=0.2
pkgrel=3
pkgdesc="udev rules for USBasp Atmel AVR programmer"
arch=('any')
url="http://www.fischl.de/usbasp/"
license=('custom')
source=('99-usbasp.rules'
        'LICENSE')
sha256sums=('b23ddffbd0ccc4f94ecd531fae9410506dcc4f10ae74dc166d1474b080745cd6'
            '2eb312826c760ff36a34327a246323ca10e50cf026a7aaaa50467b1efe4d31bc')
install=usbasp-udev.install

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-usbasp.rules" $rulesdir
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
