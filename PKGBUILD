# Maintainer: sataa <supersonicsataa@gmail.com>

pkgname=rp-alt-grub
pkgver=1.0
pkgrel=2
pkgdesc='An alternate GRUB theme using the Rosé Pine palette'
arch=('any')
url="https://github.com/FieryMewtwo/rp-alt-grub"
license=('MIT')
depends=('grub')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")  # Use "${pkgver}" instead of "1.0" in the source URL
sha256sums=('b71f0851b5ebc85420d8ad67385d1348f0472f081d9020ab083ea594dc78ca21')

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/grub/themes/${pkgname}"
    cp -R . "${pkgdir}/usr/share/grub/themes/${pkgname}"
    install -Dm 644 "license" "${pkgdir}/usr/share/licenses/${pkgname}/license"
    install -Dm 644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/readme.md"
}
