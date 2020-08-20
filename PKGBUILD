# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0+7c4918cf-14/u18/zivid-tools_2.0.0+7c4918cf-14_amd64.deb)
sha256sums=(23fc802d4b40d2be0a1ab3a8e736ff554ea25fe9a90f5d572466c0bfdcbbcaa4)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
