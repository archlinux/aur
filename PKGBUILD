# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='1.4.0+956f554d_12'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-sdk opencl-driver)
groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.4.0+956f554d-12/u18/zivid_1.4.0+956f554d-12_amd64.deb)
sha256sums=(9129aec32e45532b624ecf1c206c0cce289f0b0c8050b320bd8c2789ad785764)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
