# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=4.2.2
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/v${pkgver}/concourse_linux_amd64")
sha512sums=('4f4ade137e0f25ff2e43071bd64a3b8bd67586ee513339fc5ba9c98fee3893d3c301f950361aa24e1d78ffd9a1a8133c0a8a7f72682ec561c755996cf197830a')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/concourse"
}
