## Package Maintainer: chrispaul
pkgname=virtualshield-runit-git
_pkgname=virtualshield-runit
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield-git')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/wchurch58/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d662500221a0436f3e142c97e3e5c58e75e640c4fe596f19cc28d9ce9d1edda50f3fd6beba09fa39094d37375a28500c532af3fd0a430ea3681839137c562469')
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -D -m755 "run" "${pkgdir}/etc/runit/sv/VirtualShield/run"
}
