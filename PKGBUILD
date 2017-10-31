# Maintainer: David Birks <david@tellus.space>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('e697717ef4cbda76fa3c99198243323d92816d9040ab9779db23d165dccf9b08f140070dbb752006f17a23d0e81a837040f7d802a58ea1d70ea373def351856d')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
