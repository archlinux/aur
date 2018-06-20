# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=v3.14.1
pkgrel=2
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse-ci.org/fly.html'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64")
sha512sums=('f68f435870553914715bb76fb6a9d3ab0aafb424620cfcb7676298dce8b7ae9c904b68ba73f41ff3f64a420b72403e38b72a61db31f04a7ffbda5834f0e72b77')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/fly"
}
