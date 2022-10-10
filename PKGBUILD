# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.8.0+891708ba_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.0+891708ba-1/u18/zivid-studio_2.8.0+891708ba-1_amd64.deb)
sha256sums=(bd3a4d13b064c359d599598f64381f6bd84c711309171c79df81379b27a16e9f)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
