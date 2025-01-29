# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.7.0
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
    "b7e8c4c23b3474d2d798f7735fa7767e595fcb35b4570067fef247fdef348d8b"
)

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
