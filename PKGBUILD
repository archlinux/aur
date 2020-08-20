# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.0.0+7c4918cf_14'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0+7c4918cf-14/u18/zivid-genicam_2.0.0+7c4918cf-14_amd64.deb)
sha256sums=(3a57f2225a84b3da7f88fc27bdf47ad915bd360213176f97381af950bb32de62)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
