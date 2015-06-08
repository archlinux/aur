# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kdeartwork-aurorae-freeze
pkgver=1.2
pkgrel=1
pkgdesc="Window decoration for Aurorae, based on Breeze and Dynamo."
arch=('any')
url="http://kde-look.org/content/show.php/Freeze?content=168737"
license=('GPL')
depends=('kdebase-workspace')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/168737-Freeze-${pkgver}.tar.gz")
sha256sums=('7f70bdf61440d19a1f62317bb13b73cc375742a94c8a628afae3a1ba893b2790')

package() {
    cd "${srcdir}"
    find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/apps/aurorae/themes/{}" \;
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
