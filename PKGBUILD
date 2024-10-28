# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.4.0
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
    "$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz"
)
sha256sums=(
    "22ca17a0654bc277968a59d1435c1f2cb240e699bae815c17c679b1bdbdfa1c6"
)

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
