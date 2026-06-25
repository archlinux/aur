# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.9.0
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
sha512sums_x86_64=('935c06a54e00145d6c6a640312b300499c18d3eb34d815eab4bf8da2400c1149927c01999a578daa881452749241764c198156fd8a09046cf4628fe0ce286869')
sha512sums_armv7h=('c778762a500f1650f82d47b43b8dac6a4e6f1895b652deeb1d5ad2a9cc82eea6cf64e08b592dab395cda6380c44f8bda24a4a445edac6ed22c154502f95c14a3')
sha512sums_aarch64=('73bb4afcc0fb74f24605a9a028ae4f6c9c96f3faa3a149c904914b162e93de8eb12f16f5aeb27419462e351e40205419fbecad25a6d7314aad014e034469e939')

package() {
    install -Dm755 agg-$pkgver-$CARCH $pkgdir/usr/bin/agg
}

