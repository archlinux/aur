# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='1.6.0+7a245bbe_26'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.6.0+7a245bbe-26/u18/zivid_1.6.0+7a245bbe-26_amd64.deb)
sha256sums=(b8152f508a401d57df261862b96ff01e515e5487881f870d229bac7271b28602)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
