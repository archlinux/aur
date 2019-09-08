# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='1.5.0+63f281e2_26'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
replaces=()
groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.5.0+63f281e2-26/u18/zivid_1.5.0+63f281e2-26_amd64.deb)
sha256sums=(68e05015242c049cf0be261db2f914b14bdc8e545de4d601c4570cb24cf31160)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
