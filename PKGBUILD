# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.2.0+f0867d62_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.2.0+f0867d62-1/u18/zivid-genicam_2.2.0+f0867d62-1_amd64.deb)
sha256sums=(f1f675d7391b449fd70fd4030f8588068de04593e6db99d64d98847f3980f718)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
