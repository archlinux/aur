# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.13.0+99a4ce9e_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.13.0+99a4ce9e-1/u20/zivid-studio_2.13.0+99a4ce9e-1_amd64.deb)
sha256sums=(e581581f712a9eca4c03bb3f5be3c9738be32c414a05642bee6f5be8297037be)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
