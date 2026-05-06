# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.8.0
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
sha512sums_x86_64=('971d32f5aea76b69a9b33ee6257a35ecbb07f2f31e19d75b4ab3daed6cc3e30f2c9b5482b9f8395e0de60fb159b08f941c55e936f3361e53abd864c233f5c299')
sha512sums_armv7h=('027dd4214b727e14ad05af92c435ff0df4024c680ecb2fcae1ae23e6890dca0564a7beac870fe06881831ece2fd1e827ef978881f17e9b640c09690dfb42af06')
sha512sums_aarch64=('522acd8aeb8604b9aa60c29baa116f87cb668d6abdae41aa144865c70d40d9e6f967b6b997113325cfa128a985e992ead1978aa8920b1fc7d816cceb9d04c96c')

package() {
    install -Dm755 agg-$pkgver-$CARCH $pkgdir/usr/bin/agg
}

