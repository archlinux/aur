# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributer: JokerBoy <jokerboy at punctweb dot ro>

pkgname=elementary-usu-icons
pkgver=8.0.7
pkgrel=1
pkgdesc="Elementary icon theme from USU"
url="http://opendesktop.org/content/show.php?content=148128"
license=('GPL')
arch=('any')
depends=('librsvg')
source=("http://art.learnfree.eu/elementary_usu-${pkgver}.tar.gz")
sha256sums=('67cfe9216ef6333bf55ce7848f125a1f3d6cba08a3782af0ae3ef27600fff7c8')

package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/elementary_usu" "${pkgdir}/usr/share/icons/"
}
