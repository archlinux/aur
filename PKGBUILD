# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.7.0+e31dcbe2_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.7.0+e31dcbe2-1/u18/zivid-studio_2.7.0+e31dcbe2-1_amd64.deb)
sha256sums=(983930bf5a032c679dfd2b7c51670c98b6aaea5ba3775f9de66b908313a007ec)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
