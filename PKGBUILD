# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-defrag
pkgver=1.91.22
pkgrel=1
pkgdesc='DeFRaG is a Quake3 modification made specifically for speedruns and trickjumps.'
url='http://www.q3df.org/'
license=('GPL')
arch=('any')
depends=('quake3')
makedepends=('unzip')
source=("http://q3defrag.org/files/defrag/defrag_${pkgver}.zip")
noextract=("defrag_${pkgver}.zip")
sha256sums=('c406f3f49b94f37b9c056031b76f4b24d3aedc875f0c131547dddd42a687dea6')

package() {
    cd ${srcdir}

    # Create Destination Directory
    install -d ${pkgdir}/opt/quake3/

    # Install Base DeFRaG Files
    /usr/bin/unzip defrag_${pkgver}.zip -d $pkgdir/opt/quake3/
}
