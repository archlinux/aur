# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='1.5.0+63f281e2_26'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
replaces=()
groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.5.0+63f281e2-26/u18/zivid-tools_1.5.0+63f281e2-26_amd64.deb)
sha256sums=(10092d8fe7bab6311720137ffb67ee4047d11261ae047efffd3fc14fb7566e47)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
