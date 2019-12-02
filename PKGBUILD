# Maintainer: Blazej Sewera <blazejok1[at]wp.pl>
pkgname=otf-besley
pkgver=1.1
pkgrel=1
pkgdesc="A contemporary antique slab serif created by indestructible type*."
arch=('any')
url="https://indestructibletype.com/Besley.html"
license=('custom:OFL')
depends=('fontconfig')
source=("https://indestructibletype.com/Besley.zip")
sha256sums=('b0fc80f68dc65532dd70af868d01a35daa9d8d8f963b45866df3d4b2747a0a4f')

package() {

  install -d "$pkgdir/usr/share/fonts/besley"
  install -m644 ./*.otf "$pkgdir/usr/share/fonts/besley/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
