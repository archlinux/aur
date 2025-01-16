# Maintainer: Kristofers Solo <dev@kristofers.xyz>
pkgname=sula-alus-bin
pkgver=${GITHUB_REF#refs/tags/v}
pkgrel=1
pkgdesc="A CLI tool to reverse strings"
arch=('x86_64')
url="https://github.com/$GITHUB_REPOSITORY"
license=('MIT', 'Apache-2.0')
provides=('sula-alus')
conflicts=('sula-alus')
source=("$url/releases/download/v$pkgver/sula-alus-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 sula-alus "$pkgdir/usr/bin/sula-alus"
}
