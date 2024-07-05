# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.13.1+18e79e79_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.13.1+18e79e79-1/u20/zivid_2.13.1+18e79e79-1_amd64.deb)
sha256sums=(c5a4ba9bccc64b1ad79e4870fe9f56f84417fe8bf970b2582b49cae7f08c16cd)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
