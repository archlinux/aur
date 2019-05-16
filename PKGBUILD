# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=5.2.0
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/concourse/concourse/releases/download/v${pkgver}/fly-${pkgver}-linux-amd64.tgz")
sha512sums=('e6ac871b0071eb41b384804a3b25cecf093d21670c886e1be283a1bd6100635b2d652698b11f2ab60f4941acb10477d6cefce333bcb10fa65e7d8611b67c438d')

package() {
  install -Dm755 "${srcdir}/fly" "${pkgdir}/usr/bin/fly"
}

