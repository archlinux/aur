# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.13.0+99a4ce9e_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.13.0+99a4ce9e-1/u20/zivid-tools_2.13.0+99a4ce9e-1_amd64.deb)
sha256sums=(d3435afb61d8db22e3ac9d57d71a3afb76a8a095b4db91126b122253967fe9a4)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
