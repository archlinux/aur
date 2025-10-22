# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.7.0
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
sha512sums_x86_64=('c9d5377059cc68b81568ed9a996265d380013f2ab1ae0587036f93dc6a845e12319b3b0f76064265b4dcb50741567a4f6b6712c8c259014e0eb073e993df11f8')
sha512sums_armv7h=('10d0e0b789d057076146dd876611d30a8dc06066dc113de952f7ab7995306363c2ff9c48b2f8270223f608cd1fae6e6f4b48ee96cd49fecf0bc2ec2df55b2234')
sha512sums_aarch64=('ee1b25463ff858753765ff3501efeb07dd18c24564327e51531fb55d9af68182b277ac79632512187f419399ba9669ffeb75598b7b7c3d6ad6836244e7e06505')

package() {
    install -Dm755 agg-$pkgver-$CARCH $pkgdir/usr/bin/agg
}

