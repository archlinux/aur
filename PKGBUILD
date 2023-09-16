pkgname=astap-cli
_pkgname=astap
pkgver=2023.06.24
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer. CLI-version"
arch=('x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
source=("${_pkgname}_command-line_version_Linux_amd64.zip::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_command-line_version_Linux_amd64.zip/download")
sha256sums=('cf3c8f5348b5e226bf31afddf424c6d04b70201eadeeeb4dcf5167c18262699f')
optdepends=('hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
            'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
	    'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
	    'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
            'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV')
conflicts=('astap-bin' 'astap-bin-qt5' 'astap-cli')


package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/astap_cli" "${pkgdir}/opt/${pkgname}/${pkgname}"
}

