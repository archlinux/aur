# Maintainer: SelfRef <arch@selfref.dev>

pkgname=logitech-g923-xbox-udev
pkgver=1
pkgrel=1
pkgdesc="The udev rules for the Logitech G923 Xbox wheel"
arch=('any')
license=('MIT')
depends=('usb_modeswitch')
source=('99-logitech-g923-xbox.rules'
        '046d:c26d')
sha256sums=('6d65fbc73cf17f3fe2f2fa2ea0382d20ca6803dc3906006019da343d35444f87'
            'd352026fbe910a1fc7fb7194719cac2e8fc768033a1b732f7a4e7fa47e2988bc')

package() {
	cd "$srcdir"
	install -Dm644 '99-logitech-g923-xbox.rules' "$pkgdir/usr/lib/udev/rules.d/99-logitech-g923-xbox.rules"
	install -Dm644 '046d:c26d' "$pkgdir/usr/share/usb_modeswitch/046d:c26d"
}
