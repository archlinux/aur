# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.11.0+95829246_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.11.0+95829246-1/u20/zivid-tools_2.11.0+95829246-1_amd64.deb)
sha256sums=(33b4af9a17e21b1694472ea8309ac2516b825bdbacbac6bf55b53956ace4f178)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
