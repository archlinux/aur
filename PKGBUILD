# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.2.0
pkgrel=2
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
    "43a6c5abf9e7022d8830a1c22b74c5a1cdd9312a7fce9036acec7b4e3ce4548e"
)

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
