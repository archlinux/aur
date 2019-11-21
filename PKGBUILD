# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='1.7.0+a115eaa4_4'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.7.0+a115eaa4-4/u18/zivid-genicam_1.7.0+a115eaa4-4_amd64.deb)
sha256sums=(7c9e25e07fa4121100e79a157161607e3b798068032490d1f4dd0395b023d7eb)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
