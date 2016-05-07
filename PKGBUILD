# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha256sums=('d98a60ac8755e75c190763385cb397609880dddbbf4ba15d1bb3467b9a6679e2')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
