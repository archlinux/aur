# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='1.7.0+a115eaa4_4'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.7.0+a115eaa4-4/u18/zivid_1.7.0+a115eaa4-4_amd64.deb)
sha256sums=(ddf82c5761c9f22842cb476618cc2c06dae7e3ef52a76468e57d258a71f4600e)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
