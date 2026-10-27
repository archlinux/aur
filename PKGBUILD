# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=3.0.4
pkgrel=1
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("f103f5b53156bbcf94f82427979a476497d85de50158a3598996962722bab6d6")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("3deb041ea4d304654da6097ba30ec096362ac568a36fea6a84d9d3c455eed04b")

source_armv7h=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-armv7-unknown-linux-gnueabihf.tar.xz")
sha256sums_armv7h=("0226ad960c3f9bf7d936338aad22bdd894be85b48e174bd0f33fd11b645afb80")

package () {
    cd "minijinja-cli-$CARCH-unknown-linux-gnu"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
