## Package Maintainer: chrispaul
pkgname=virtualshield-openrc-git
_pkgname=virtualshield-openrc
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('virtualshield-git')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/wchurch58/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e89b634bf6fb678c91dca9942a24fc75655b9145596c8f9e48bec7c48f1c5a0ba233453a78b79cb7cfed55aa301797a13e99afb25fc4b823e028745d879b80d2')
package() {
cd "${srcdir}/${_pkgname}-${pkgver}"
       install -D -m755 "virtualshield-svc" "${pkgdir}/etc/init.d/virtualshield-svc"
}
