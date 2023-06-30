pkgname="hnsky-bin"
_pkgname="hnsky"
pkgver=4.2.15
pkgrel=3
pkgdesc="Semi professional free planetarium program"
arch=("x86_64")
url='https://sourceforge.net/projects/hnsky/'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/hnsky/files/linux_installer/hnsky_amd64.tar.gz/download")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('348893a7cc071c540a7b777ef558f208da8ab5a29bddffcf70b2d0264fe06dac')
optdepends=('kchmviewer: A .chm files (MS HTML help file format) viewer'
	    'hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
            'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
	    'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
	    'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
            'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV')

package() {
	tar -xf "${pkgname}-${pkgver}.tar.gz" -C "$pkgdir"
}
