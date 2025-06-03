# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide-release
pkgver=0.18.2
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-linux-amd64.tar.gz")
sha256sums=('f108689ca597b9c9d90fa816607b7318d3beb18824093d34b48751c47d97b13a')

options=('!strip' '!debug')

package() {
    install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
