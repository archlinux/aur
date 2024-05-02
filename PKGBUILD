# Maintainer: Juan C. Müller <me at juancmuller dot com>

pkgname=duo-desktop
pkgver=2.0.0
pkgrel=4
pkgdesc="Duo Desktop gives Duo customers more control over which computers can access corporate applications based on the trust (with Trusted Endpoints) and security posture of the device (with Device Health)."
arch=('x86_64')
license=('custom')
url="https://duo.com/docs/duo-desktop"
depends=('ca-certificates' 'openssl' 'zlib')
replaces=('duo-device-health')
options=(!strip)
source=("https://desktop.pkg.duosecurity.com/${pkgname}-latest.${arch}.rpm")
sha512sums=('2a7aa6a7e84b30b3a30d073f6975af87febb761c7f9868a3e88bf4bc04ce7fe58db8f36aa4a5b543e7bbf2bff2f9e49b65a67515eb985bbe2323b67384ee5661')
install=duo.install

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
