# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=asciinema-agg-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='asciinema gif generator (binary version)'
provides=('agg')
conflicts=('asciinema-agg')
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/asciinema/agg'
license=('Apache')
source_x86_64=("agg-x86_64::$url/releases/download/v$pkgver/agg-x86_64-unknown-linux-gnu")
source_armv7h=("agg-armv7h::$url/releases/download/v$pkgver/agg-arm-unknown-linux-gnueabihf")
source_aarch64=("agg-aarch64::$url/releases/download/v$pkgver/agg-aarch64-unknown-linux-gnu")
sha512sums_x86_64=('4b6590f32d3ba5b44e3c188f4d133f91b4724bc282dd212a00de6b90b33e0eb22d8584b655ac57a4e373a3927ce330a814f6b75e31a4dd1cc856348f01e59892')
sha512sums_armv7h=('f7f4f240e844c5ff5a2686eaadde2210abfa6d71ae4aaaaee386e57409c7b7e9a71bd292960cbd3f1076508957097089589f85b1a3dc47b368f6353af7c477de')
sha512sums_aarch64=('d49d92c7155446e585bb47af654123b7a6bf3bd1edd7b1b033deae45dc397643a1b8d84ee887f252532131c8eaafe967cccd9fae15bcc6085b5b29e91d6a2160')


package() {
    install -Dm755 agg-$CARCH $pkgdir/usr/bin/agg
}

