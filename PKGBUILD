# Maintainer: Francisco Giordano <fg@frang.io>

pkgname=comby-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="A code rewrite tool for structural search and replace that supports ~every language."
arch=('x86_64')
url="https://comby.dev/"
license=('Apache')
source=("comby-$pkgver.tar.gz::https://github.com/comby-tools/comby/releases/download/$pkgver/comby-$pkgver-x86_64-linux.tar.gz")
sha256sums=('ec0ca6477822154d71033e0b0a724c23a0608b99028ecab492bc9876ae8c458a')

package() {
        install -Dm755 "comby-$pkgver-x86_64-linux" "$pkgdir/usr/bin/comby"
}

# vim: et sw=8 ft=PKGBUILD
