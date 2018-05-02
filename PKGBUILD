# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=v3.13.0
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse.ci/fly-cli.html'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64")
sha512sums=('394695a16a38f228a784d74777f211a98d3c531c33c3260d4c2155f920c0145ae02ad18e433abffe6b36138e33b19dc4ab46e245468b3da2f935bb307b593fca')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/fly"
}
