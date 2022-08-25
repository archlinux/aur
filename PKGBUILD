# Maintainer: Matthew Ellison <ellison(at)censys(dot)io>

_pkgname='duoconnect'
pkgname="${_pkgname}-bin"
pkgver=2.0.3
pkgrel=1
pkgdesc="Easily access your organization’s SSH servers and RDP hosts without needing to use a VPN when your organization has deployed Duo Network Gateway"
arch=('x86_64')
url="https://ory.sh"
license=('custom')
depends=()
provides=("${_pkgname}")
source=("https://dl.duosecurity.com/DuoConnect-${pkgver}.tar.gz")
sha256sums=('c92a3d1d9223a6ec4ab3757dc9477dfab93d173bbf86d00f59a84232cb8ec3cd')

package() {
    install -m755 -D "${srcdir}/duoconnect" "${pkgdir}/usr/bin/duoconnect"
}
