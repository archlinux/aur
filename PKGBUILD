# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=v3.9.2
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse.ci/fly-cli.html'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64")
sha512sums=('dd3e9f5af661656c2315608919f471da91c4f737a9e68ee9865c5dd5e3e3786c1f8703836a97d5d9ca23d448f460c13e72dd8c83c717229a76f7011a6dc51275')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/fly"
}
