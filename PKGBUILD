# Maintainer: David Birks <david@tellus.space>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.12.1
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('7bb11d50d37f3e632f8ce5231c2c71af9c76de40e37d95df3bcd2546e950315534d602bb379085d2cfd0ed432efca197dfa10db2c0362df76c35e9650de96afd')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
