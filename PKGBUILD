## Package Maintainer: Karl-K

pkgname=virtualshield-runit
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/karl-k/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9a31cb1d78018bd24870f1138a2f5aac520f0a7b15c5bdc3d8aa9b92a8662fa2971c94d6bb5a04d610105e6a6574ccb053419b4644fee22fca9677707bdb41f8')


## Runit

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 "run" "${pkgdir}/etc/runit/sv/VirtualShield/run"

}
