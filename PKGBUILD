# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=4.2.3
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/v${pkgver}/concourse_linux_amd64")
sha512sums=('1ea914ee6a96127aefa4c1d82c13d5af02a09f5daa2839a0b9201a6dfdb1dfdc7f79999b6d3bed6de2f0a1a0425a75f09bba0987bdd6f0a251b0d841cff798dd')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "$pkgdir/usr/bin/concourse"
}
