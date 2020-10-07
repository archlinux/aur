# Maintainer:  Vincent Grande <shoober420@gmail.com>

pkgname=vtmb-unofficialpatch
pkgver=107.1
pkgrel=1
arch=('x86_64')
url="https://www.moddb.com/mods/vtmb-unofficial-patch/downloads/"
#source=("https://www.moddb.com/mods/vtmb-unofficial-patch/downloads/")
#sha256sums=('SKIP')
pkgdesc="vampire: the masquerade - bloodlines unofficial patch"

prepare() {

wget -O VTMBup$pkgver.exe https://www.moddb.com/downloads/mirror/194719/122/ea00345a0092918dfebe1d3b31578f4c/?referer=https%3A%2F%2Fwww.moddb.com%2Fmods%2Fvtmb-unofficial-patch%2Fdownloads

mv $srcdir/VTMBup$pkgver.exe $startdir

}
