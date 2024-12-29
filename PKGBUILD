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
sha256sums=('7853b6a66bd4186a9e8c3b9c937b28a938ca7ce19f3855da08d14d6fe8d64f63')

package() {
    install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
