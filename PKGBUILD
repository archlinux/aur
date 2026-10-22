# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nats-top-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="A top-like tool for monitoring NATS servers"
arch=(x86_64 aarch64 armv7h i686)
url="https://github.com/nats-io/nats-top"
license=(MIT)
depends=(glibc)
provides=(nats-top)
conflicts=(nats-top)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_armv7.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_386.tar.gz")
sha256sums_x86_64=('02004d5e3c9a7afb839f00737924147f9f2f381552639b0e941a72c9ad113148')
sha256sums_aarch64=('27023b5fd93b050a9ec9b9d7099a2e6474afb0cda555e34104286e3af08d3e6e')
sha256sums_armv7h=('3ed89bc7ab08ea83262f21af0990d7a3314cc2768d64096fe128604dfae989d8')
sha256sums_i686=('c3f07f264845afbc3ec940af5ac7be95855e465da84dad424df35d4f28cdec2f')

package() {
    install -Dm755 nats-top -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
