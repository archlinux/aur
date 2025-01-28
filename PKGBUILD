# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.14.1+b4e8f261_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.1+b4e8f261-1/u20/zivid-studio_2.14.1+b4e8f261-1_amd64.deb)
sha256sums=(64f84ba1176a48b7611140b9cba3344163340e454f8dbb579f4a092fea5f1aaa)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
