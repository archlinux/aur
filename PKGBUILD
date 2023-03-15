# Maintainer: Flávio Tapajós <tapajos@outlook.com>

_pkgname='ory-cli'
pkgname="${_pkgname}-bin"
pkgver=0.2.2
pkgrel=1
pkgdesc="ORY Command Line Interface (CLI)"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/cli/releases/download/v${pkgver//_/-}/ory_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('296bec4ed8aeb25cae24d5dfb0ad6d742f924e87d45981c3c45582b22884a449')

package() {
    install -m755 -D "${srcdir}/ory" "${pkgdir}/usr/bin/ory"
}
