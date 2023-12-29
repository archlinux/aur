# Maintainer: Jordan Handboy <jordanhandboy1@yahoo.com>
pkgname=animetetris
pkgver=1.3
pkgrel=1
pkgdesc="A simple block game"
arch=(x86_64)
url="https://github.com/jordanhandboy/Tetris"
license=('unknown')
depends=('python' 'python-pygame')
makedepends=('git')
install=
source=("https://github.com/jordanhandboy/Tetris/releases/download/v1.3/animetetris.tar.gz")
md5sums=('SKIP')


package() {
	
	install -Dm755 ./bg.jpg "$pkgdir/usr/share/animetetris/bg.jpg"
	install -Dm755 ./animetetris.desktop "$pkgdir/usr/share/applications/animetetris.desktop"
	install -Dm755 ./block.py "$pkgdir/usr/share/animetetris/block.py"
	install -Dm755 ./main.py "$pkgdir/usr/share/animetetris/main.py"
	install -Dm755 ./tetris_controller.py "$pkgdir/usr/share/animetetris/tetris_controller.py"
	install -Dm755 ./tetris_game.py "$pkgdir/usr/share/animetetris/tetris_game.py"
	install -Dm755 ./tetris_pencil.py "$pkgdir/usr/share/animetetris/tetris_pencil.py"
	install -Dm755 ./text.py "$pkgdir/usr/share/animetetris/text.py"
}
