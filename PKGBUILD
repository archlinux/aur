# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=4.2.1
pkgrel=2
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/v${pkgver}/concourse_linux_amd64")
sha512sums=('f883a0f6c748647ae18868dbdb8a769d050b8955994ead271b65eb46201f38b2b3d3231ac2fc6c5ac45b6457b3db79d20ae162b78be06ebb85741f1a90c8a0eb')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/concourse"
}
