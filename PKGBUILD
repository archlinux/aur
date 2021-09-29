# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.4.2+1a2e8cfb_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.2+1a2e8cfb-1/u18/zivid_2.4.2+1a2e8cfb-1_amd64.deb)
sha256sums=(80fcbb87321029a024b818289730ad5d04e01324c86bde36960fdee289d05a36)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
