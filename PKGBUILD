# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=6.4.1
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
optdepends=('zsh-completions: auto completion for fly on zsh shell')
source=("https://github.com/concourse/concourse/releases/download/v${pkgver}/fly-${pkgver}-linux-amd64.tgz")
sha512sums=('04b08d7a31aeae7e6bc09c3c1a4fc482116294335df315efacbd1218e76e20277d857c887d01257b57bf869e9e544dbc0739301a59dc82073f160d3fc43baf25')

package() {
  install -Dm755 "${srcdir}/fly" "${pkgdir}/usr/bin/fly"
}
