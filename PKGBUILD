# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='orange-bin'
_pkgname='orange'
pkgver='0.6.5'
pkgrel='1'
pkgdesc='Cross-platform local file search engine'
arch=('x86_64')

license=('GPL3')

depends=(
    'libappindicator-gtk3'
    'webkit2gtk'
    'gtk3'
)

url='https://github.com/naaive/orange/'

# DEB package
source=("${url}/releases/download/orange-v${pkgver}/orange_${pkgver}_amd64.deb")

sha256sums=('6871fdda9f29d5b2ec685f18bf0457aa517f24a0ae01c64e81b6f09409da278f')

package() {
    msg "make ${pkgname} package"

    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/"data.tar.*
}
