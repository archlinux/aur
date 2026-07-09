# Maintainer: John Ingve Schjølberg <john.schjolberg@zivid.com>

pkgname=zivid-studio
pkgver='2.18.0+1b44dbef_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.18.0+1b44dbef-1/u20/zivid-studio_2.18.0+1b44dbef-1_amd64.deb)
sha256sums=(a93ed515216a93cfddc07d85763a10be60e6cecc2a4e1b14a41c5b33848e556a)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
