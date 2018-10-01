# Maintainer: Dct Mei <dctxmei@gmail.com>
pkgname=libinput-touchpad
pkgver=1.0
pkgrel=2
pkgdesc="Libinput's touchpad configuration supplement"
arch=('any')
groups=('xorg')
depends=('xf86-input-libinput')
source=("30-touchpad.conf")
sha512sums=('b8446632a2515aa61d66a993dcc33db27dde3346d67d8b2cce8b588957639e6caac07534b1fbf5e3d169fa17e2cb0afa0c1337c251e70b4ff237e9ccdbf09424')

package() {
    install -Dm644 "$srcdir"/30-touchpad.conf "$pkgdir"/usr/share/X11/xorg.conf.d/30-touchpad.conf
}
