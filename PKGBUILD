# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.5.0+19fa6891_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.5.0+19fa6891-1/u18/zivid-genicam_2.5.0+19fa6891-1_amd64.deb)
sha256sums=(044a3bb26b9ae24f7639f220991e2e741fc518cae963c6a0d949b6dea07746f0)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
