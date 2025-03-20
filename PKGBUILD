# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide
pkgver=0.18.0
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')
provides=('roxide')
conflicts=('roxide')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-linux-amd64.tar.gz")
sha256sums=('f7a436e316d8b948ac964c1a9b5e8766f201011ab2c53545cb020d79167fe478')

options=('!strip' '!debug')

package() {
    install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
