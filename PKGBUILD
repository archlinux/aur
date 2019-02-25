# Maintainer: Kwrazi <kwrazi_at_gmail_dot_com>

pkgname=plantuml-ascii-math
pkgver=20171116
pkgrel=2
pkgdesc="Plantuml language extension to allow use AsciiMath or JLaTeXMath notation"
arch=(any)
url="http://plantuml.com/ascii-math"
license=('GPL')
depends=("plantuml" "jlatexmath")
source=("http://beta.plantuml.net/plantuml-jlatexmath.zip")
sha256sums=('e041164c6dce5dec3377242a0664c1855d863094dd51c28880888f59820fc7e2')

package() {
  install -m755 -d ${pkgdir}/usr/share/java/plantuml
  install -m644 -D ${srcdir}/*.jar ${pkgdir}/usr/share/java/plantuml
}
