# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0+7c4918cf-14/u18/zivid-studio_2.0.0+7c4918cf-14_amd64.deb)
sha256sums=(7edcdbc029be47f0eb0164ef412ff5a081ce2aa84a8b0ccf62d066dacf6dffb2)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
