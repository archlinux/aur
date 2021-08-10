# Maintainer: LeSnake <dev.lesnake@posteo.de>
# Based of pkgbuild from qdirstat made by: phiresky <phireskyde+git@gmail.com>

pkgname=qdirstat-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)"
arch=(i686 x86_64)
url="https://github.com/shundhammer/qdirstat"
license=('GPL2')
groups=()
depends=('qt5-base' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
provides=()
conflicts=("qdirstat" "qdirstat-git")
replaces=()
backup=()
options=()
install=qdirstat-bin.install
source=("https://github.com/LeSnake04/aur-lesnake04-sources/raw/main/qdirstat-bin/qdirstat-bin-$pkgver-$pkgrel-x86_64.tar.gz")
noextract=()
sha256sums=('fb5a454ea37cac8b3c81953e878fed05fc624afe8bd97a23a5e608e0104b780d')
md5sums=('de789ea4acce5f1ea4f5402be7c98950')

package() {
	cp -rv $srcdir/usr $pkgdir/usr
}
