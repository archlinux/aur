# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rmtrash
pkgver=1.14
pkgrel=1
pkgdesc='trash-put made compatible to GNUs rm and rmdir'
arch=('any')
url='https://github.com/PhrozenByte/rmtrash'
license=('GPL')
depends=('trash-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhrozenByte/rmtrash/archive/v$pkgver.tar.gz")
sha256sums=('119cf1a5e9c5ecadb95cfcc46999a5db6d55e0bb822f411c9a1b9c7d0cdf76b7')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" rmtrash
    install -Dm755 -t "$pkgdir/usr/bin" rmdirtrash
}

# vim:set ts=4 sw=4 et:
