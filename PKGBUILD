# Maintainer: LeSnake <dev.lesnake@posteo.de>
# Based of pkgbuild from qdirstat made by: phiresky <phireskyde+git@gmail.com>

pkgname=qdirstat-bin
pkgver=1.8
pkgrel=1
_srcpkgver=
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
sha512sums=('99cfc3a406ffa5bd58410d6f2e8f822926ff9f27c77f2918a133baa1b54073554776c76f31a2bbcbbf501b19f5aabef147e10191e0cacdab309c299d8452689b')

package() {
	cp -rv $srcdir/usr $pkgdir/usr
}
