# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.1.2
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
    "ea9bffa1ecada7215fe376aafe0e58ac924384628fd2789b7aad4f6279f0a800"
)

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
