# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.8.1
pkgrel=1
pkgdesc='asciinema gif generator (binary version)'
provides=('asciinema-agg')
conflicts=('asciinema-agg')
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/asciinema/agg'
license=('GPLv3')
source_x86_64=("agg-$pkgver-x86_64::$url/releases/download/v$pkgver/agg-x86_64-unknown-linux-gnu")
source_armv7h=("agg-$pkgver-armv7h::$url/releases/download/v$pkgver/agg-arm-unknown-linux-gnueabihf")
source_aarch64=("agg-$pkgver-aarch64::$url/releases/download/v$pkgver/agg-aarch64-unknown-linux-gnu")
sha512sums_x86_64=('7bd015e3bb2c3efcfcdde97333236c2f2cd100c579b26d0b85f5e62e56125bf0f728ae0988d9740037a489bb74234c6b3e863c310a5b4f4c0d5c876cca62c18b')
sha512sums_armv7h=('b31079ad5dc7cb4a87deb35d2969c608346c3846d9a86dc67dcbf2a71988baf487ffa0ec03e2624d26f7537d7ca00ff0ffd6279ea69a72674c694e57615eb213')
sha512sums_aarch64=('5e4b4fa2c6d9f0d5302a6315c6f62273549237a942b5f595ce5cd8ad48db0e4ed32185106ae6d9926e6fc0a0e6b2b95cfa2348d6609b396d80107b94040a37fa')

package() {
    install -Dm755 agg-$pkgver-$CARCH $pkgdir/usr/bin/agg
}

