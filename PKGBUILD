# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit-bin
pkgver=0.5.1
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'aarch64')

source_x86_64=('fixit-x86_64-0.5.1.tar.gz::https://github.com/eugene-babichenko/fixit/releases/download/v0.5.1/fixit-v0.5.1-x86_64-unknown-linux-musl.tar.gz')
sha256sums_x86_64=('30c61b4543fa8a7cf9201a40f4aef93c5b99848b8d2241dbf13e7e9f54652247')

source_aarch64=('fixit-aarch64-0.5.1.tar.gz::https://github.com/eugene-babichenko/fixit/releases/download/v0.5.1/fixit-v0.5.1-aarch64-unknown-linux-musl.tar.gz')
sha256sums_aarch64=('8475f42b4d5a8040fa950d9c96468763e5298020cbd369263b06789fccc69e4f')

package() {
  install -Dm755 fixit -t "$pkgdir/usr/bin"
}

