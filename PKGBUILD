# Maintainer of the original ultimate version:
#    juankfree <juan77.sonic@gmail.com>
pkgname=razer-blackwidow-2014
pkgver=0.0.5
pkgrel=2
pkgdesc="Enables M1-M5 and FN keys in Linux for the Razer BlackWidow 2014 keyboard"
arch=('any')
url="https://github.com/skogler/razer-blackwidow-2014"
license=('GPL2')
depends=('python-pyusb' 'xorg-xmodmap')
provides=('razer-blackwidow-2014')
conflicts=('razer-blackwidow-macro-scripts')
options=('!strip')
install="razer-blackwidow-2014.install"
source=('git+https://github.com/skogler/razer-blackwidow-2014')
md5sums=('SKIP')
package() {
  cd "${srcdir}/razer-blackwidow-2014/"
	install -Dm755 "razer-blackwidow-2014.py" "${pkgdir}/usr/bin/razer-blackwidow-2014.py"
	install -Dm755 "razer-blackwidow-2014.sh" "${pkgdir}/usr/bin/razer-blackwidow-2014"
	install -Dm644 "99-razer-blackwidow-2014.rules" "${pkgdir}/usr/lib/udev/rules.d/99-razer-blackwidow-2014.rules"
	install -Dm644 "razer-blackwidow-2014.desktop" "${pkgdir}/etc/xdg/autostart/razer-blackwidow-2014.desktop"
}

