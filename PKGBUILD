# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='2.0.0.1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
replaces=(z i v i d - t e l i c a m - s d k)
groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.5.0+63f281e2-26/u18/zivid-telicam-driver_2.0.0.1-1_amd64.deb)
sha256sums=(f2e74c45ec0513296a1508226fae2ec00cbca99d6e8f27938f5be64a435ea1ea)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
