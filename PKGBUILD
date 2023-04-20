# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.9.0+4dbba385_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.9.0+4dbba385-1/u18/zivid-studio_2.9.0+4dbba385-1_amd64.deb)
sha256sums=(2329c2500a3c8ec42e1980ac34c34cfab9715b12b48a6dff4af1484881b7f9dd)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
