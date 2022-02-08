# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.6.1+6cec8609_3'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.1+6cec8609-3/u18/zivid-studio_2.6.1+6cec8609-3_amd64.deb)
sha256sums=(837d25f5a1ea25fa54a783caf9ca36af236cc1d3b1bc6700b0240af2355ab49a)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
