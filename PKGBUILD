# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.6.1+6cec8609_3'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.1+6cec8609-3/u18/zivid-tools_2.6.1+6cec8609-3_amd64.deb)
sha256sums=(ea09c0d4abc4378f830b25492c1e3388772b64133fbf75b25c99e60a9d743050)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
