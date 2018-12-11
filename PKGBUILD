# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=4.2.2
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}" "${_pkgname}-git")
source=("${pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/v${pkgver}/fly_linux_amd64")
sha512sums=('79941e71b91765ff05b59d3405d51f9d8f1591194724c84fd6a85d752eda74b46a4869daa0378bd7844bcb876801d70754a874e86f491e93e59c4b9a99c6f930')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/fly"
}
