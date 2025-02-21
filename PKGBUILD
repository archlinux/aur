# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.14.2+1a322f18_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.2+1a322f18-1/u20/zivid-studio_2.14.2+1a322f18-1_amd64.deb)
sha256sums=(a61fbe3f23ba53e03db73517ef2c2eb2a0a84a959be4269b15679e726bed4689)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
