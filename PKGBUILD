# Maintainer: David Birks <david@tellus.space>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('802e392190c26d628466d64e2c020ac2e48f098a2f4c568178cb004281f389084220ab600c0cf2172e4adb32b16527142d9da9b9d014dc67e1f41b15f01946d3')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
