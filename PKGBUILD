# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide-release
pkgver=0.20.0
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('94af5847ad53d1c71c2145814190c98bec15ff40404cf04e0d8bf4c31f9358cc')

options=('!strip' '!debug')

package() {
	install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
