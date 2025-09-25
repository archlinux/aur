# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='asciinema gif generator (binary version)'
provides=('asciinema-agg')
conflicts=('asciinema-agg')
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/asciinema/agg'
license=('Apache')
source_x86_64=("agg-$pkgver-x86_64::$url/releases/download/v$pkgver/agg-x86_64-unknown-linux-gnu")
source_armv7h=("agg-$pkgver-armv7h::$url/releases/download/v$pkgver/agg-arm-unknown-linux-gnueabihf")
source_aarch64=("agg-$pkgver-aarch64::$url/releases/download/v$pkgver/agg-aarch64-unknown-linux-gnu")
sha512sums_x86_64=('f5e5b3b65253b651e9e8abc7252a5f0b38d393175383c90af1808c62a811bd6f9466349f1a995320d31479651020010412c40a30bec35a170e685db44adf9a8d')
sha512sums_armv7h=('754e96793ff09767659a480ee1e89595ca4c770ac93a0537c8f0a7fd8e60f4e78a3c88b57252f79a0bd54071ec96ccbd874fcead458cfc701faddb0ccceccca7')
sha512sums_aarch64=('03f4e2b51d4f75edbe7d3f36e1e96cb3770042c32b076665eed371e8c17a935cec2a44ebe3e0df2324483e9e4af8d4a5576c848a002f12c97d9058fb1ee21f90')

package() {
    install -Dm755 agg-$pkgver-$CARCH $pkgdir/usr/bin/agg
}

