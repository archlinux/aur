# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=5.7.1
pkgrel=2
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
optdepends=('zsh-completions: auto completion for fly on zsh shell')
source=("https://github.com/concourse/concourse/releases/download/v${pkgver}/fly-${pkgver}-linux-amd64.tgz")
sha512sums=('cc66245667d6f35a6f5173ca64b889047c820812cd5170a61d6eb441f47cdce46288133bc38d7a0ad6610ca6cfb8813153fa11c8d8d335a05133f7c5a61b88ef')

package() {
  install -Dm755 "${srcdir}/fly" "${pkgdir}/usr/bin/fly"
}
