# Maintainer: Jordan Handboy <jordanhandboy1@yahoo.com>
pkgname=animetetris-bin
pkgver=1.0
pkgrel=2
pkgdesc="A simple block game"
arch=(x86_64)
url="https://github.com/jordanhandboy/Tetris"
license=('unknown')
depends=('python' 'python-pygame')
makedepends=('git')
install=
source=("https://github.com/jordanhandboy/Tetris/releases/download/v1.1/animetetris.tar.gz")
md5sums=('SKIP')


package() {
	
	install -Dm755 ./animetetris "$pkgdir/usr/bin/animetetris"
	install -Dm755 ./bg.jpg "$pkgdir/usr/share/animetetris/bg.jpg"
}
