# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=5.0.1
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/concourse/concourse/releases/download/v${pkgver}/fly-${pkgver}-linux-amd64.tgz")
sha512sums=('75805ae4a66dae6a0d43c71164baa67d517e8d0992ac16ef89160355823ef1a649db862f5c6e9e3db56cb2598025d7869d4cc3a6a5f029d7c692f3e1a76d58a0')

package() {
  install -Dm755 "${srcdir}/fly" "${pkgdir}/usr/bin/fly"
}

