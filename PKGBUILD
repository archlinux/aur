# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
pkgname=cherryctl-bin
pkgver=0.10.0
pkgrel=4
pkgdesc='Cherry Servers CLI for managing cloud infrastructure (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/cherryservers/cherryctl'
license=('MPL-2.0')
depends=('glibc')
conflicts=('cherryctl')
provides=("cherryctl=${pkgver}")
options=('!strip' '!debug')
source_x86_64=("cherryctl-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/cherryctl-linux-amd64")
source_aarch64=("cherryctl-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/cherryctl-linux-arm64")
sha256sums_x86_64=('f19f5e63594757f8be159dcb7992622c8363d5727888a1aafa939fed223f913a')
sha256sums_aarch64=('fde7c9d63b51bdd3dd2fad1bee436659e068565ac05c776d84432008191e25b7')

package() {
  install -Dm755 "cherryctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cherryctl"
}
