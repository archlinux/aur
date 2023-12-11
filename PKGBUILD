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
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname TrueType/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.txt
}
