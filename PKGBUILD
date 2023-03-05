# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calmly-writer-bin
_pkgname=calmly-writer
pkgver=2.0.52
pkgrel=1
pkgdesc="Calmly Writer is an editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=('x86_64')
url="https://www.calmlywriter.com"
license=('unknown')
conflicts=('calmly-writer')
depends=()
options=()
source=("${_pkgname}_${pkgver}.deb::${url}/releases/linux/deb/x64/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('38c9564575899ab334ca25f0e9e8d3b8d9ef392eaf7e04150ea281c49652817c10c37b236f82bec6cd9b902baeb1d3e371901d9ebbbfbf82d720e89e934b3b58')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}
