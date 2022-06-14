# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.7.0+e31dcbe2_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.7.0+e31dcbe2-1/u18/zivid-genicam_2.7.0+e31dcbe2-1_amd64.deb)
sha256sums=(5780f0f30628e1d02681b408a4ef00bc6eeb5566706f712e9d746863501c8566)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
