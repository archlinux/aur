# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='1.5.0+63f281e2_26'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.5.0+63f281e2-26/u18/zivid-studio_1.5.0+63f281e2-26_amd64.deb)
sha256sums=(382b56f6bc4ac5fcf7a0e4c7508647f2d56e107abc5339c3d3a9d6371ccdb4dd)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
