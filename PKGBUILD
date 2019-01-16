# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname=openpolicyagent
pkgname=${_pkgname}-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="General Purpose Policy Engine with Unified, Context-aware Policy Enforcement"
arch=('x86_64')
url="https://openpolicyagent.org"
license=('Apache')
conflicts=('openpolicyagent')
provides=('openpolicyagent')

source=("https://github.com/open-policy-agent/opa/releases/download/v${pkgver}/opa_linux_amd64")

sha256sums=('60f8247509f4a0e32739cd6d997f1600d644eed4b27e9a4d1489479cc5eb570f')

package(){
 install -Dm755 "${srcdir}/opa_linux_amd64" "${pkgdir}/usr/bin/opa"
}
