# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='naaive-orange'
_pkgname='orange'
pkgver='0.6'
pkgrel='5'
pkgdesc='Cross-platform local file search engine'
arch=('x86_64')
license=('GPL3')
url='https://github.com/naaive/orange'

depends=(
    'libappindicator-gtk3'
    'webkit2gtk'
    'gtk3'
)

source=("${url}/releases/download/${_pkgname}-v${pkgver}.${pkgrel}/${_pkgname}_${pkgver}.${pkgrel}_amd64.deb")

sha256sums=('6871fdda9f29d5b2ec685f18bf0457aa517f24a0ae01c64e81b6f09409da278f')

package() {
    msg "build ${_pkgname} package"
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
}
