# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=5.1.0
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/concourse/concourse/releases/download/v${pkgver}/fly-${pkgver}-linux-amd64.tgz")
sha512sums=('2b254314430e2fe2c40fcdf10e363e8abfb905d74bbb828c7e6d792fdb71b4d5c96b6601a04fb0225573ebe37791f78f463c199959f3990d9ddf39773a54822a')

package() {
  install -Dm755 "${srcdir}/fly" "${pkgdir}/usr/bin/fly"
}

