# Maintainer: Juan C. Müller <me at juancmuller dot com>

pkgname=duo-desktop
pkgver=2.0.0
pkgrel=2
pkgdesc="Duo Desktop gives Duo customers more control over which computers can access corporate applications based on the trust (with Trusted Endpoints) and security posture of the device (with Device Health)."
arch=('x86_64')
license=('custom')
url="https://duo.com/docs/duo-desktop"
depends=('ca-certificates' 'openssl' 'zlib')
replaces=('duo-device-health')
options=(!strip)
source=("https://desktop.pkg.duosecurity.com/${pkgname}-latest.${arch}.rpm")
sha512sums=('d46e31947c599fe5caa84ead6ffe4dd211c6de56b73ff8925beaefd038dced0f90fa18c780d8c7662423fa0100085ec06f516105412bc50483abb8a2f13d2dc9')
install=duo.install

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
