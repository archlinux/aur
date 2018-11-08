# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rmtrash
pkgver=1.12
pkgrel=1
pkgdesc='trash-put made compatible to GNUs rm and rmdir'
arch=('any')
url='https://github.com/PhrozenByte/rmtrash'
license=('GPL')
depends=('trash-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhrozenByte/rmtrash/archive/v$pkgver.tar.gz")
sha256sums=('23a39883c2706a105ba291b3eaf0d10119f40aedfd58abe2b302ec2c97280353')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" rmtrash
    install -Dm755 -t "$pkgdir/usr/bin" rmdirtrash
}

# vim:set ts=4 sw=4 et:
