# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('d7dbfce8cccf69d9c4c2946c58003cc388808006453b07b1e05bd21c906cf74cf5a3d0150f427bfd06d62b1f11aa772c1453630ab7ac88e60a407ed70e1caf4f')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
