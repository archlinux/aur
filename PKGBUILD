# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-defrag
pkgver=1.91.20
pkgrel=1
pkgdesc='DeFRaG is a Quake3 modification made specifically for speedruns and trickjumps.'
url='http://defrag.planetquake.gamespy.com/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('quake3')
makedepends=('unzip')
install=
source=("http://q3defrag.org/files/defrag/defrag_${pkgver}.zip")
noextract=("defrag_${pkgver}.zip")
md5sums=('5753a41c668b38a1954afd3ecd836c54')

build() {
	cd $srcdir

    # Create Destination Directory
	install -d $pkgdir/opt/quake3/

    # Install Base DeFRaG Files
	/usr/bin/unzip defrag_$pkgver.zip -d $pkgdir/opt/quake3/
}
