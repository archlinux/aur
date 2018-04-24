# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>

_pkgname='concourse-fly'
pkgname="${_pkgname}-bin"
pkgver=v3.11.0
pkgrel=1
pkgdesc='A command line interface that runs a build in a container with ATC.'
arch=(x86_64)
url='https://concourse.ci/fly-cli.html'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${pkgname}-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64")
sha512sums=('89dccb032bb1f83a756c6dd84027e2089fa926dd043208b7f50e4fdafa69904a350e0b1f923b43ff8a1ec26d39a7835dcb3a73617e8b29e93619783b58caf9b3')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/fly"
}
