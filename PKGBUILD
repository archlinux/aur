# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.7.0+e31dcbe2_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.7.0+e31dcbe2-1/u18/zivid_2.7.0+e31dcbe2-1_amd64.deb)
sha256sums=(daaef0dd5242d5eb3fd2d7672b6ff126b46c203c28de295370a3a5c5b2d1ca39)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
