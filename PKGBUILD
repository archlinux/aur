# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.9
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('2029dad2ab2740376273b715f27e950511c8392b1e575226a922a818041dbf95f60eca51f33b3b036cf5cc5b6f8f8b0a81221e1d80ff69f4ddad8e0f8ed37ba2')
b2sums_i686=('644ffd81728019debc0a402b7dcca48d6f8bbd0930c87fec7f42ef8288719c4014d8da1d67ad1b55a542ca5a85104aa32e227f662073bd62f4299d3704b2da66')
b2sums_x86_64=('91f4814f173387fde20a7be56d3cb65d01108a007b9c8f08edbb5ee2b02331641bf2d3a52a914b7879a8dce6350d3005d3dad081a032676f9f46a5128c4983e4')
b2sums_armv7h=('0c252b040d32b4b7b9e9258e7ebb6e45f1adf4970853b1292e1c6c55c95293f4a8e87951d9f034144a831f28fa50a4178c52361933f8c78adb20b45e5a75c532')
b2sums_aarch64=('e6070b76f03cf684f909b2d01b48bfe97217d033a3dcc6ce5e9eed3737f16013d7a7b72d23bf501c67f174115205adbdeaf0207f5286555163df417b379c7ea6')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
