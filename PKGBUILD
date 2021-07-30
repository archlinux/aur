# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-defrag
pkgver=1.91.27
pkgrel=1
pkgdesc='A Quake3 modification made specifically for speedruns and trickjumps.'
url='http://www.q3df.org/'
license=('GPL')
arch=('any')
depends=('quake3')
makedepends=('unzip')
source=("https://q3defrag.org/files/defrag/defrag_${pkgver}.zip")
noextract=("defrag_${pkgver}.zip")
sha256sums=('b19794626af927d31ebd71f841f9336fd04d52c4f48d7cac567780430b94b7a7')

package() {
    cd "${srcdir}"

    # Create Destination Directory
    install -d "${pkgdir}/opt/quake3/"

    # Install Base DeFRaG Files
    /usr/bin/unzip "defrag_${pkgver}.zip" -d "${pkgdir}/opt/quake3/"
}

