# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.6.1+6cec8609_3'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.1+6cec8609-3/u18/zivid_2.6.1+6cec8609-3_amd64.deb)
sha256sums=(b0ee57ec4ad0a2ceda61bdab8097ed5ad0a28cdf990e78afe33b13233a7c9fa7)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
