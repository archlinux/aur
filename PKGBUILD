# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='1.6.0+7a245bbe_26'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.6.0+7a245bbe-26/u18/zivid-genicam_1.6.0+7a245bbe-26_amd64.deb)
sha256sums=(23e7437b6b7d435c49f06290ee7bf33cf3d26a5e5a54814c479b270902934d7a)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
