# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.14.0+e4a0c4a9_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.0+e4a0c4a9-1/u20/zivid-studio_2.14.0+e4a0c4a9-1_amd64.deb)
sha256sums=(64601396dfe1eab8a0127f3a6ba0dbbe77fad3b19b19b124634d52faa30728d5)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
