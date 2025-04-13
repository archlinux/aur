# Maintainer: LauraSabucedo
# Contributor: valonsogit

pkgname=jason-bin
pkgver=3.3.0
pkgrel=1
pkgdesc='Fully-fledged interpreter for an extended version of AgentSpeak, a BDI agent-oriented logic programming language.'
arch=(x86_64)
url='https://github.com/jason-lang/jason'
license=('LGPL-3.0-or-later')
depends=('java-environment=21')
provides=(jason)
conflicts=(jason)
sha256sums=('SKIP')
# options=('!strip')
source=("${url}/releases/download/v${pkgver}/jason-bin-${pkgver}.zip")

package() {
    install -Dm755 "${srcdir}/bin/jason" "${pkgdir}/usr/bin/jason"
}