# Maintainer: tarball <bootctl@gmail.com>

pkgname=noseyparker-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='find secrets and sensitive information in textual data and Git history'
url='https://github.com/praetorian-inc/noseyparker'
arch=(x86_64)
license=(Apache)
provides=(noseyparker)
conflicts=(noseyparker)
depends=(glibc)
noextract=("$pkgname-$pkgver")

source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/noseyparker-v$pkgver-x86_64-unknown-linux-gnu")
sha256sums=('ef6132bf7797d7229f11187e7a0794a341da7bda3f7dc5107a06fc51a8420494')

package() {
  install -Dm755 $pkgname-$pkgver \
    "$pkgdir"/usr/bin/noseyparker
}
