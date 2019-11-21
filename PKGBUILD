# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.7.0+a115eaa4-4/u18/zivid-tools_1.7.0+a115eaa4-4_amd64.deb)
sha256sums=(375acf4aa1e36f8e5262791a9f8744f19311a1847f47fb2075cdc7b0b86bddc9)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
