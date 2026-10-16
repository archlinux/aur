# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=3.0.1
pkgrel=1
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("5b2eb07b18d5804e50b4e83ebdaae9b70dda37f4a2d058987881396e6c91c8b6")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("445bf828667b1ab083cc61383c71897c6c62435bdff797c30d0ca1d4c63f1e25")

source_armv7h=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-armv7-unknown-linux-gnueabihf.tar.xz")
sha256sums_armv7h=("412010f6e76e163ad0b0aa49c34e45d42665e7c1a226c0e79b516d3c83ac1c22")

package () {
    cd "minijinja-cli-$CARCH-unknown-linux-gnu"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
