pkgname=astap-cli
_pkgname=astap
pkgver=2023.05.31
pkgrel=0
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer. CLI-version"
arch=('x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
source=("${_pkgname}_command-line_version_Linux_amd64.zip::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_command-line_version_Linux_amd64.zip/download")
sha256sums=('dfb041235913bc0caf88526f3514c3775f7d2db70bb1c91b152c17f77d5b735a')


package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/astap_cli" "${pkgdir}/opt/${pkgname}/${pkgname}"
}

