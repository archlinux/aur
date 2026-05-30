# Maintainer: Peter Olofsson <petolofsson@gmail.com>
pkgname=gitcake-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Personal work tracker for developers, backed by a dedicated git repo"
arch=('x86_64')
url="https://github.com/petolofsson/gitcake"
license=('MIT')
provides=('gitcake')
conflicts=('gitcake')
source=("gitcake-${pkgver}.tar.gz::https://github.com/petolofsson/gitcake/releases/download/v${pkgver}/gitcake-linux-x86_64.tar.gz")
sha256sums=('b3df23422c535750d2448dfd1cb04605c3a9ffb967ec1681014a0507acc4572b')

package() {
    install -Dm755 "${srcdir}/gitcake"     "${pkgdir}/usr/bin/gitcake"
    install -Dm755 "${srcdir}/gitcake-mcp" "${pkgdir}/usr/bin/gitcake-mcp"
}
