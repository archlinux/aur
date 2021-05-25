# Maintainer: Blazej Sewera <blazejok1[at]wp.pl>
pkgname=otf-besley
pkgver=2.0
pkgrel=1
pkgdesc="A contemporary antique slab serif created by indestructible type*."
arch=('any')
url="https://indestructibletype.com/Besley.html"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/indestructible-type/Besley/files/5761580/Besley.zip")
sha256sums=('330c2616e2040e555bbd05fa6f48b43f4c862c3f454f08eadef73c3a99ae729b')

package() {

  install -d "$pkgdir/usr/share/fonts/besley"
  install -m644 ./*.otf "$pkgdir/usr/share/fonts/besley/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
