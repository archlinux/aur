# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide
pkgver=0.17.3
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')
provides=('roxide')
conflicts=('roxide')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a40817488b569d4305fee38d1f30cba852729bb50758d037f6c6f03bf7e73b59')

package() {
    install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
