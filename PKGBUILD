# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide-release
pkgver=0.21.0
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('650de93bc0f262ed2fb3262c68c8f86b3aee5eee4926487e7a9419676438eec1')

options=('!strip' '!debug')

package() {
	install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
