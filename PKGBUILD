# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='asciinema gif generator (binary version)'
provides=('asciinema-agg')
conflicts=('asciinema-agg')
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/asciinema/agg'
license=('Apache')
source_x86_64=("agg-x86_64::$url/releases/download/v$pkgver/agg-x86_64-unknown-linux-gnu")
source_armv7h=("agg-armv7h::$url/releases/download/v$pkgver/agg-arm-unknown-linux-gnueabihf")
source_aarch64=("agg-aarch64::$url/releases/download/v$pkgver/agg-aarch64-unknown-linux-gnu")
sha512sums_x86_64=('d45b77cd2af6bc544a6a6c5de2a1be787445f6d00a17b775fbe3b440d5da475773f4638c69081365a00e1c43d4ab82533d717055adaaa78635bb62ec7db38f1f')
sha512sums_armv7h=('0adbcbbecd9f2ce001db8770ba79215d62872970370f83cbcf12d50c11a7d404d240a9416d90221f298c830dbb03ed393fea4a0592fce7605a6c6135f8ec643f')
sha512sums_aarch64=('d71c6c23388e1252d86890ff046eb63aeeb2dd29f489ffd8d0d8484cffa4061d945f1457babd3361850cf6e6db56b92f0e4dc9c2bdf76e2241c542db6f0f754f')

package() {
    install -Dm755 agg-$CARCH $pkgdir/usr/bin/agg
}

