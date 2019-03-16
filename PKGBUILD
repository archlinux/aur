# Maintainer: Dct Mei <dctxmei@gmail.com>
pkgname=libinput-touchpad
pkgver=1.0
pkgrel=3
pkgdesc="Libinput's touchpad configuration supplement"
arch=('any')
groups=('xorg')
depends=('xf86-input-libinput')
source=("30-touchpad.conf")
sha512sums=('32c9e60dcf4eafce5fbfeddee5787871eb9606adacba11107ebc5a4e29123dde3b18744583505026a6ef9efb62e00d9ef3c719b9e63d137f6c01ab515f1eca58')

package() {
    install -Dm644 "$srcdir"/30-touchpad.conf "$pkgdir"/usr/share/X11/xorg.conf.d/30-touchpad.conf
}
