# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=ctffind
pkgver=4.1.5
pkgrel=1
pkgdesc="Find CTFs of electron micrographs"
arch=(x86_64)
url="http://grigoriefflab.janelia.org/ctf"
license=('GPL')
depends=('')
optdepends=('pdftk: for improved pdf output'
	    'gnuplot: for improved pdf output')
source=("http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/ctffind-$pkgver-linux64.tar.gz")
md5sums=('4e5ffbe72097819d12945f6392e22dcc')
options=()

#prepare () {
#}
#build() {
#}

package() {
	cd "$srcdir/bin"
	install -d $pkgdir/usr/bin/
	install -D -m755 ctffind $pkgdir/usr/bin/.
	install -D -m755 ctffind_plot_results.sh $pkgdir/usr/bin/.
}
