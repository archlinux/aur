# Maintainer: kakuun333 <kakuun333 at gmail dot com>

pkgname=pacdot-bin
_pkgname=pacdot
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple backup and restore tool for personal Arch Linux setups"
arch=('x86_64')
options=('!debug')
url="https://github.com/kakuun333/pacdot"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('pacdot')
conflicts=('pacdot')
source=("LICENSE::https://raw.githubusercontent.com/kakuun333/pacdot/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-$CARCH.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH.tar.gz")
sha256sums=('afebd810bc76e84187781bd73b094a95386953d4dde160866e8d2777d6bb67e0')
sha256sums_x86_64=('c1b2f407057299540f0fea5beeff96d7bcf6c32de72987edfa320abddbd698ce')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
