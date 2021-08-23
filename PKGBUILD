# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.4.1+55718627_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.1+55718627-1/u18/zivid-tools_2.4.1+55718627-1_amd64.deb)
sha256sums=(e501df83ed250578b1d2822909619664f941b8429a4f56e1ae2cd98cf49d7f1a)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
