# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-defrag
pkgver=1.91.23
pkgrel=1
pkgdesc='DeFRaG is a Quake3 modification made specifically for speedruns and trickjumps.'
url='http://www.q3df.org/'
license=('GPL')
arch=('any')
depends=('quake3')
makedepends=('unzip')
source=("http://q3defrag.org/files/defrag/defrag_${pkgver}.zip")
noextract=("defrag_${pkgver}.zip")
sha256sums=('d3527d5da2d102837af467a54086ad12b50a5992e2923b0ea9181a68767b182c')

package() {
    cd ${srcdir}

    # Create Destination Directory
    install -d ${pkgdir}/opt/quake3/

    # Install Base DeFRaG Files
    /usr/bin/unzip defrag_${pkgver}.zip -d $pkgdir/opt/quake3/
}

