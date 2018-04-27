# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=v3.12.0
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse.ci/fly-cli.html'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64")
sha512sums=('176033638ac5ea0ad389630381ae2de0264ecad28a3ae3b2ffc9f57c21dfc9f90a1dca77e437d7acbf0e80bef2d8551d49634500b6bafd30308115ccb5fe64aa')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/fly"
}
