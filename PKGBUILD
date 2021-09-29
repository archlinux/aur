# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.4.2+1a2e8cfb_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.2+1a2e8cfb-1/u18/zivid-genicam_2.4.2+1a2e8cfb-1_amd64.deb)
sha256sums=(849a924ced04ad6ee6db0f184e20aab1cf8dbb1a1e439e67012aa4a3effbe63b)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
