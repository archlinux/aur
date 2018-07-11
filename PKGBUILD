## Package Maintainer: wchurch58

pkgname=virtualshield-runit
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wchurch58/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f324e165739ecea72e5b9bc017e8c7334b9c4fbe1d0fc6417be3f5cea2171a4f131719aee71ce8d881e601a79f37471f2697b2767e8939c45a7c89bf2ccce7ef')


## Runit

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "run" "${pkgdir}/etc/runit/sv/VirtualShield/run"

}
