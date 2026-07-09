# Maintainer: John Ingve Schjølberg <john.schjolberg@zivid.com>

pkgname=zivid-opencl
pkgver='2.18.0+1b44dbef_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=(zivid-cuda)
provides=(zivid-backend)

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.18.0+1b44dbef-1/u20/zivid-opencl_2.18.0+1b44dbef-1_amd64.deb)
sha256sums=(e9c9955ad861bfd0d92cb5bbb8aacc0b7c4e5fd14a104371cfd99bc117440d4a)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
