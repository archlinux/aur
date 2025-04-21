# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit-bin
pkgver=0.10.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'aarch64')

source_x86_64=('fixit-x86_64-0.10.0.tar.gz::https://github.com/eugene-babichenko/fixit/releases/download/v0.10.0/fixit-v0.10.0-x86_64-unknown-linux-musl.tar.gz')
sha256sums_x86_64=('39f9338847d9c28e26e224c2e7cbe336e257d902d73ee8cc8e640c7a2326f3e1')

source_aarch64=('fixit-aarch64-0.10.0.tar.gz::https://github.com/eugene-babichenko/fixit/releases/download/v0.10.0/fixit-v0.10.0-aarch64-unknown-linux-musl.tar.gz')
sha256sums_aarch64=('27517958319dc89334b0e1cd0701bd7740b29a14589fb68382f1f5744a949f90')

package() {
  install -Dm755 fixit -t "$pkgdir/usr/bin"
}

