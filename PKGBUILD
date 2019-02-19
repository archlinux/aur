# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=4.2.3
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/v${pkgver}/fly_linux_amd64")
sha512sums=('190adeefe0a18be8b7f7d09b107a369cace7e170705a566ca5226dc43d1ccfe29c7979ee382aa5dde03be67360f2ea33f4e04cb2ca5b9e241dcba3d6f63cd3e2')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/fly"
}
