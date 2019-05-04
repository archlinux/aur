# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='1.3.0+bb9ee328_10'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
optdepends=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.3.0+bb9ee328-10/u18/zivid-tools_1.3.0+bb9ee328-10_amd64.deb)
sha256sums=(42770346ec3b4012673b522809c15046bd67959760f7b8de0ce2e77a041041eb)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
