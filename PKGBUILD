# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=roxide-release
pkgver=0.20.5
pkgrel=1
pkgdesc="A git repositories manager CLI, easy to use and very fast"
arch=('x86_64')
url="https://github.com/fioncat/roxide"
license=('MIT')
depends=('git' 'fzf')

source=("$pkgname-$pkgver::https://github.com/fioncat/roxide/releases/download/v${pkgver}/roxide-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('24bd974398e4d898bdeede5b206c83370f6816c8782be2a909d79a162602df70')

options=('!strip' '!debug')

package() {
	install -Dm755 "roxide" "$pkgdir/usr/bin/roxide"
}
