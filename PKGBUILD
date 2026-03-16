# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.18.0
pkgrel=2
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("c90529ea722301473b91516c1be9493453256e1992df9905faeb48f43c4d2aa5")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("4052c6ac05e3f7f0dc0a7e6ecb0f972e3b5a392b069b115a9b3be1e815ea9528")

source_armv7h=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-armv7-unknown-linux-gnueabihf.tar.xz")
sha256sums_armv7h=("0cb0f9a2ae5ebcff2d9cf45c22ae3017d5e1e0f001082bda087fe7a8ada8d6ad")

package () {
    cd "minijinja-cli-$CARCH-unknown-linux-gnu"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
