# Maintainer: Sam Toxopeus <sam@toxopeus.it>
pkgname=promql-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="Query prometheus from the command line for quick analysis."
arch=('x86_64')
url="https://github.com/nalbury/promql-cli"
license=('Apache 2.0')
groups=()
depends=()
source=("$url/releases/download/v$pkgver/promql-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    tar -xzf "promql-v${pkgver}-linux-amd64.tar.gz"
    install -Dm755 "promql" "$pkgdir/usr/bin/promql"
}
