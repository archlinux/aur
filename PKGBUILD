# Maintainer: John Ingve Schjølberg <john.schjolberg@zivid.com>

pkgname=zivid-cuda
pkgver='2.18.0+1b44dbef_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(nvidia-utils)
conflicts=(zivid-opencl)
provides=(zivid-backend)

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.18.0+1b44dbef-1/u20/zivid-cuda_2.18.0+1b44dbef-1_amd64.deb)
sha256sums=(4a3eea9747062978b57f292b5fe4f79e2217007e1b0f111583e0fde6e99767c9)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
