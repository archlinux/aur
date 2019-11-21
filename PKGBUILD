# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='1.7.0+a115eaa4_4'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.7.0+a115eaa4-4/u18/zivid-studio_1.7.0+a115eaa4-4_amd64.deb)
sha256sums=(b1ae1ac6dceaca6a9e0d990b23366062e5638d5b2bc770e92cbf33b768b15d83)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
