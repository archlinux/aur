# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.1+6cec8609-3/u18/zivid-genicam_2.6.1+6cec8609-3_amd64.deb)
sha256sums=(1bea2b113cf23ace4b955794e8f6dc2e156f813c9794e838214dcd24f3ae85d6)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
