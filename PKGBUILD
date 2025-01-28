# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.14.1+b4e8f261_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.1+b4e8f261-1/u20/zivid_2.14.1+b4e8f261-1_amd64.deb)
sha256sums=(c45160e645ef9fd94350f8b5ba5cfd9a3ce94e1abe802fc659e6dda8020ffb50)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
