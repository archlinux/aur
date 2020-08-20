# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.0.0+7c4918cf_14'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0+7c4918cf-14/u18/zivid_2.0.0+7c4918cf-14_amd64.deb)
sha256sums=(5c247ac62516b42e49335cc5fa3cdacbcd0babe4141f33a9132b025ae796e0ed)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
