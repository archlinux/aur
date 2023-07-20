# Maintainer: icefox <hd@revive-it.ru>

pkgbase=aspia-client
pkgname=(aspia-client)
pkgver=2.5.2
pkgrel=3
pkgdesc="Remote desktop and file transfer tool."
arch=('x86_64')
url="https://github.com/dchapyshev/aspia"
license=('GPL3')
options=('!strip')
source_x86_64=("${pkgbase}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${arch}.deb")
sha256sums_x86_64=('5295342c21d099dd1f2ad09559875cb6f22b5367e85d16ec27d2d152775f9fad')

package() {
cd "${srcdir}"
bsdtar -xzf data.tar.gz -C "${pkgdir}"
}
