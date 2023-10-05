# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.4.3
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
sha512sums_x86_64=('a488df7a1db748b1f7cf8046d0fa8a11dce6307544f5d90a90c2559060f12e6d22b88270b4b953dcc647cc2f1bf2d68416ab46c6aa0e3d0e7f3f29fede328cec')
sha512sums_armv7h=('855e2e828d555d42bc531a9552adc389b87b270a3c92ea50001968cae0798abb0be82108d7d7016182b4b587ba72e9dfaa58bd169f8090f0d0ef605b236a36d4')
sha512sums_aarch64=('b60cfe7689f42124b6029c5476a56806e9d116228d9db4b90c9fd57c033301f5107bfd8ad4a05dca8198db3625e9f37fe7c3f187e8816340e7f4b5d68b6fd30d')

package() {
    install -Dm755 agg-$CARCH $pkgdir/usr/bin/agg
}

