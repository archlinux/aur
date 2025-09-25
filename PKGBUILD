# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide-release
pkgver=0.20.4
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5628fb5f74424b27d826cdab0c9531396f27d4b781f5a11cf4a1de142ac09b55')

options=('!strip' '!debug')

package() {
	install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
