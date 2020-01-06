# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='1.8.0+89ae8b3e_39'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.0+89ae8b3e-39/u18/zivid-studio_1.8.0+89ae8b3e-39_amd64.deb)
sha256sums=(fed67b75020af84e0929049a53767ac4814c78c0533a783939826f547b6087ff)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
