# Maintainer: Juan C. Müller <me at juancmuller dot com>

pkgname=duo-desktop
pkgver=2.0.0
pkgrel=1
pkgdesc="Duo Desktop gives Duo customers more control over which computers can access corporate applications based on the trust (with Trusted Endpoints) and security posture of the device (with Device Health)."
arch=('x86_64')
license=('custom')
url="https://duo.com/docs/duo-desktop"
depends=('ca-certificates' 'openssl' 'zlib')
replaces=('duo-device-health')
options=(!strip)
source=("https://desktop.pkg.duosecurity.com/${pkgname}-latest.${arch}.rpm")
sha512sums=('0f9f9650be490d812b96d43f616f4a47ca9d0bef1d322dfc9cb86b3de6b7f63faab6d70d72f250ee4e7ca3330e038b39007bf62fcfae0304ec632972bd750c5d')
install=duo.install

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
