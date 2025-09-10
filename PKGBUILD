# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide-release
pkgver=0.19.0
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e7cee24b4a9d16488f16ee904d02f1badb4d8b1fc8a4f30616739b5551078f4c')

options=('!strip' '!debug')

package() {
	install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
