# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Contributor: Matthew Longley <randomticktock@gmail.com>

pkgname=ttf-mona
pkgver=2.90
pkgrel=2
pkgdesc="A Japanese proportional font which allows you to view Japanese text arts correctly."
license=("custom")
arch=("any")
url="http://monafont.sourceforge.net/"
source=(
  "http://downloads.sourceforge.net/monafont/monafont-ttf-${pkgver}.zip"
  "license.txt"
)
sha256sums=(
  "06b324342ad13ea06a7e74811e1334a28cc52a1a16f9a326a919249622daeed6"
  "faebecfa8a8b117d7e2ea3b13e111d04aee5782ec2a1178dba34a9b3d5560e3b"
)

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 mona.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/custom/${pkgname}" 
  install -m644 license.txt "${pkgdir}/usr/share/licenses/custom/${pkgname}/license.txt"
}
