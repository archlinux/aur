# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide
pkgver=0.17.4
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')
provides=('roxide')
conflicts=('roxide')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8b44377d537e453fb07f5ffc5cdafbda0e6732c0179eaff2d17a47cef992fa8a')

package() {
    install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
