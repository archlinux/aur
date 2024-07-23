# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)
_archive="minijinja-cli-x86_64-unknown-linux-gnu"
source=(
    "$url/releases/download/$pkgver/$_archive.tar.xz"
)
sha256sums=(
    "d0ffe683b3362e298241fd51e6a2a68687f0d247738d24c9cfd95bc75634b71c"
)

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
