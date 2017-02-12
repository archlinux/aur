# Maintainer: Александр Бантьев (Alexander Bantyev) aka balsoft <balsoft@yandex.ru>
# Contributor: wadealer
pkgname="qomp"
pkgver="1.1.1"
pkgrel=1
pkgdesc="Quick(Qt) Online Music Player - one player for different online music hostings."
makedepends=("cmake","make","libcue",)
arch=("any")
url="https://sourceforge.net/projects/qomp/"
license=("GPLv2")
source=("https://downloads.sourceforge.net/project/qomp/1.1.1/qomp_1.1.1_src.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fqomp%2Ffiles%2F1.1.1%2F&ts=1486883225&use_mirror=netix")
md5sums=("639b292fe2ac8e955a6c491c36cfefac")
function build {
	cd "$srcdir/$pkgname-$pkgver"
	cmake .
	sudo make install prefix="$pkgdir"
	
}
function package {
	echo "ok"
}