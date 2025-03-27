# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide
pkgver=0.18.1
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')
provides=('roxide')
conflicts=('roxide')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-linux-amd64.tar.gz")
sha256sums=('e8002663339586be45b50d6a5e37ff192e9b6ba77102dfef4043dd7c3317ff2a')

options=('!strip' '!debug')

package() {
    install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
