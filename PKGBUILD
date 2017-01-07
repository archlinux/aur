#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2017.1.7
pkgrel=1
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/xac"
depends=(haskell-pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  http://xyne.archlinux.ca/projects/xac/src/xac-2017.1.7.tar.xz
  http://xyne.archlinux.ca/projects/xac/src/xac-2017.1.7.tar.xz.sig
)
sha512sums=(
  a0096ab13d282860a72c36938927dbfafbf5c21543a65db604a6e02f489880b68cb47cbef95df610e132a21e7b54b504f7c7b64c3632c71c30ba29fb65110e14
  a7c15bbf5996cfb986bf12235de66c315432e65a7afcb0eb5a5d1205831996b97cc1f3cc11b62693286adeb1ee53196b96217f4d059ffb6cfe317b7d4b2cf003
)
md5sums=(
  26cda5863bcd0bfb3faa85dde4ca2725
  3b6b9a597d9daab175eb78a61d46a399
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
