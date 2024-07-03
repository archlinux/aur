# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.13.0+99a4ce9e_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.13.0+99a4ce9e-1/u20/zivid_2.13.0+99a4ce9e-1_amd64.deb)
sha256sums=(b43a990928493ae725d54b09898ef40561c7bbd9b786539af9e3ee4d92aec8b1)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
