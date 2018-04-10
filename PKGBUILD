# Maintainer: David Birks <david@tellus.space>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('0b5c8492446fc2c3808e3a053b220d63db85288e106b63ca4744ed8c376ec03e14ac93fbed8310c848bb6167644db305b1289eebe3846b14761caba4ef71287f')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
