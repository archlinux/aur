# Maintainer: Matthew Ellison <ellison(at)censys(dot)io>

_pkgname='duoconnect'
pkgname="${_pkgname}-bin"
pkgver=2.0.4
pkgrel=1
pkgdesc="Easily access your organization’s SSH servers and RDP hosts without needing to use a VPN when your organization has deployed Duo Network Gateway"
arch=('x86_64')
url="https://duo.com/docs/duoconnect-notes"
license=('custom')
depends=()
provides=("${_pkgname}")
source=("https://dl.duosecurity.com/DuoConnect-${pkgver}.tar.gz")
sha256sums=('97e4dbeac895499db1c0f8655d85838d0ebfb82a62ea78c550789c978d9fb197')

package() {
    install -m755 -D "${srcdir}/duoconnect" "${pkgdir}/usr/bin/duoconnect"
}
