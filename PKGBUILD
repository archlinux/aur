# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Tom Wambold <tom5760@gmail.com>

pkgname=frogatto-data
_pkgname='frogatto'
arch=('any')
pkgver=1.3.1
pkgrel=6
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog (data files)"
url="http://www.frogatto.com"
license=('custom')
depends=(perl)
makedepends=()
source=("frogatto-$pkgver.tar.gz::https://github.com/frogatto/frogatto/tarball/$pkgver")
sha512sums=('8c549811f0a89560a8367ddc2e7dd3510cc8162a68f3431d811bf0b2e1977c20bdaf5f90e6e143ce0044711203a964bf46cbb40712b5dd7e8ed45dddb981051d')

package() {
  cd "$_pkgname-$_pkgname"*

  mkdir -p "$pkgdir"/opt/frogatto/
  cp -r data images music modules "$pkgdir"/opt/frogatto/
  install -D -m644 FreeMono.ttf "$pkgdir"/opt/frogatto/FreeMono.ttf
  install -D -m644 DejaVuSans.ttf "$pkgdir"/opt/frogatto/DejaVuSans.ttf
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/frogatto-data/LICENSE
}

# vim:set ts=2 sw=2 et:
