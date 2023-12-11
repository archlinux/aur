# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Blazej Sewera <blazejok1 at wp dot pl>

_pkgname=besley
pkgname=otf-$_pkgname
pkgver=2.0
pkgrel=1
pkgdesc='A serif font by indestructible type* inspired by designs of Robert Besley'
arch=('any')
url=https://indestructibletype.com/Besley
license=(OFL)

source=(https://github.com/indestructible-type/Besley/files/5761580/Besley.zip)
sha256sums=(330c2616e2040e555bbd05fa6f48b43f4c862c3f454f08eadef73c3a99ae729b)

package() {
  install -d "$pkgdir/usr/share/fonts/besley"
  install -m644 ./TrueType/*.ttf "$pkgdir/usr/share/fonts/besley/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
