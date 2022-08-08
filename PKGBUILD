# Maintainer: LeSnake <dev.lesnake@posteo.de>
# Based of pkgbuild from qdirstat made by: phiresky <phireskyde+git@gmail.com>

pkgname=qdirstat-bin
pkgver=1.8.1
pkgrel=1
_srcpkgver=$pkgver
_srcpkgrel=$pkgrel
pkgdesc="Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)"
arch=(x86_64)
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
source=("https://github.com/LeSnake04/aur-lesnake04-sources/raw/main/qdirstat-bin/qdirstat-bin-$_srcpkgver-$_srcpkgrel-x86_64.tar.gz")
noextract=()
sha512sums=('189dd4c9690af4c67a3a0f89db6852188d9df28155cfb3c35d3545f8f8f2cad0cbcff35b0126aebabfedb95632376eabb7b68b7ac6139087d39cee11363f43e8')

package() {
	cp -rv $srcdir/usr $pkgdir/usr
}
