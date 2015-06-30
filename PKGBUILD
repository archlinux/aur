# Maintainer: Nick Hu <nickhu00@gmail.com>
pkgname=puush
pkgver=1.2
pkgrel=1
pkgdesc="A bash script to upload to and delete from puush.me"
arch=(any)
url="https://github.com/NickHu/puush-linux"
license=('MIT')
depends=(curl bash)
optdepends=('scrot: screenshot tool')
install=puush.install
source=(https://github.com/NickHu/puush-linux/archive/v${pkgver}.tar.gz)
md5sums=('cbcbed1b7dc21691d02b81393af52f0c')

package() {
	cd "$srcdir/$pkgname-linux-$pkgver"
	install -Dm 755 puush $pkgdir/usr/bin/puush
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
