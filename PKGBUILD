# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=7.4.2
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
sha256sums=('cf3f20cd26521955830b2687486defaa30485e43ef90e2ffe2403d8821de625d')
package() {
  install -Dm755 "${srcdir}/fly" "${pkgdir}/usr/bin/fly"
}
