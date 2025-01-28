# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://downloads.zivid.com/sdk/releases/2.14.1+b4e8f261-1/u20/zivid-genicam_2.14.1+b4e8f261-1_amd64.deb)
sha256sums=(6417a8f29d1c14b078df86dafb8be5eb6120f2a32314cd0befbf0254ef3e89d2)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
