# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('099a3fa9148490766c89214d4dd7fc0c4ec33a6d2a28247a09b12f497260433035cc4c843692ea513680d44dae343bbb91149915943fe7aaa74d2a24776cb9fc')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
