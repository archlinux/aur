# Maintainer: Juan C. Müller <me at juancmuller dot com>

pkgname=duo-desktop
pkgver=2.0.0
pkgrel=3
pkgdesc="Duo Desktop gives Duo customers more control over which computers can access corporate applications based on the trust (with Trusted Endpoints) and security posture of the device (with Device Health)."
arch=('x86_64')
license=('custom')
url="https://duo.com/docs/duo-desktop"
depends=('ca-certificates' 'openssl' 'zlib')
replaces=('duo-device-health')
options=(!strip)
source=("https://desktop.pkg.duosecurity.com/${pkgname}-latest.${arch}.rpm")
sha512sums=('d37a88b76c07b98f0b9e5b1ffd1ad07e0d1c6a6e924c13ce6b1b14970f67ad299ea6766b17951136c3edb33edae1788597881ccdb4cd6295f66bfb9da22bb5b0')
install=duo.install

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
