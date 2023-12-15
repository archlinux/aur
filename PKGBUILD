# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://downloads.zivid.com/sdk/releases/2.11.0+95829246-1/u20/zivid-genicam_2.11.0+95829246-1_amd64.deb)
sha256sums=(df6d41f5d491c81c7d8fc3884d1fcfa7e64560ee6f83f4a04055c919c52da88f)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
