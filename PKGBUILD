# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha256sums=('2fdbe2b9e721d129d69fae358b20a7da3cd11d44cb603a3927a2d4dbff1b50ae')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
