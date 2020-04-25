# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=ddutility
pkgname=ddutility-bin
pkgver=1.6
pkgrel=1
pkgdesc="Write and Backup Operating System IMG and ISO files on Memory Card or Disk"
arch=('any')
license=('custom')
url="https://www.thefanclub.co.za/how-to/dd-utility-write-and-backup-operating-system-img-and-iso-files-memory-card-or-disk"
depends=('bash' 'coreutils' 'gzip' 'lsof' 'udevil' 'xz' 'zenity' 'zip')
conflicts=('ddutility-bin-pt-br')
provides=('ddutility')
options=('!strip' '!emptydirs')
source=("https://raw.githubusercontent.com/thefanclub/dd-utility/master/DEB/${_pkgname}_${pkgver}_all.deb")
sha256sums=('bf01d8fc8fafaf76ab751fbcf6b54d75930581e62d602fcaf4cd28fe23579224')

package_ddutility-bin() {
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -Dm644 "${pkgdir}/usr/share/doc/ddutility/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
