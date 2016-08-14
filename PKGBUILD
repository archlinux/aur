# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
depends=()
optdepends=()
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('8017ad131f164a11a0d2a392646f006bfb17b45cef7e3d388cf114b5960a947e81465f6feca876cc7062dd2b85dc9f758c0d6ee7cb0719d1950a811fd7c470d0')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
