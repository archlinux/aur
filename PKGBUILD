# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rmtrash
pkgver=1.15
pkgrel=1
pkgdesc='trash-put made compatible to GNUs rm and rmdir'
arch=('any')
url='https://github.com/PhrozenByte/rmtrash'
license=('GPL3')
depends=('trash-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhrozenByte/rmtrash/archive/v$pkgver.tar.gz")
sha256sums=('e238f24fe22a5fc6f35e137b000cb943b72debf2d02bd06a2c851804c6b15e4b')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" rmtrash
    install -Dm755 -t "$pkgdir/usr/bin" rmdirtrash
}
