# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=7.3.1
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
sha256sums=('7667e48e38ff97cf0a7ae0a9038c2cbc7eda5f2cbbd9e2868768e7b0bfefd7de')
package() {
  install -Dm755 "${srcdir}/fly" "${pkgdir}/usr/bin/fly"
}
