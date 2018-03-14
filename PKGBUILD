# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=v3.9.2
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse.ci/introduction.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64")
sha512sums=('6bff93228e8e7a311cd6710c0ede4940d1b2026a75e577c36feca2764082aab2fca2e8cfde523ed14ff623ef133a57c719f8a27e2772c3950c2e1cfa0104ff66')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/concourse"
}
