# Maintainer: LeSnake <dev.lesnake@posteo.de>
# Based of pkgbuild from qdirstat made by: phiresky <phireskyde+git@gmail.com>

pkgname=qdirstat-bin
pkgver=1.9
pkgrel=1
pkgdesc="Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)"
arch=(x86_64)
url="https://github.com/shundhammer/qdirstat"
license=('GPL2')
groups=()
depends=('qt5-base' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
provides=("qdirstat")
conflicts=("qdirstat" "qdirstat-git")
replaces=()
backup=()
options=()
install=qdirstat-bin.install
source=("https://github.com/LeSnake04/aur-packages/raw/main/qdirstat-bin/qdirstat-bin-$pkgver-$pkgrel-x86_64.tar.zst")
noextract=()
sha512sums=('fabc3017b20d00031935b1f273f8508e77658e5d6fa41bf638201d89bd0cb682f9006e125f2740d6541a6cfa36fd469162e6586926b30364d90582c4f120b629')

package() {
	cp -rv $srcdir/usr $pkgdir/usr
}
