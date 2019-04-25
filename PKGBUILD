pkgname=fairphone-udev
pkgver=0.2
pkgrel=3
pkgdesc="udev rules for Fairphone 1 and 2"
arch=('any')
url="http://www.fairphone.com/"
license=('custom')
source=('99-fairphone.rules'
        'LICENSE')
sha256sums=('e4e68bd53bb4b35bd7bb2ae93f485588405896a42ccb5b9f26f1a57302fe14bc'
            '89693819795a9e97568aa31384e97856f4109fe2a67b56776189c9402f8f6b3b')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p "$rulesdir"
    cp "99-fairphone.rules" "$rulesdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
