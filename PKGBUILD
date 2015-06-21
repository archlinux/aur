#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2014.12
pkgrel=1
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/xac"
depends=(python3 haskell-pandoc)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'tex2png: plugin support' 'source-highlight: plugin support')
source=(
  http://xyne.archlinux.ca/projects/xac/src/xac-2014.12.tar.xz
  http://xyne.archlinux.ca/projects/xac/src/xac-2014.12.tar.xz.sig
)
sha512sums=(
  6717766a87f4ab2699a5fdd43a781ab5752aa337a7a3fb07463bc2cbb2f1f0307e9a743d3253aabcb8aef957c8a59e5c7004634d7700e215574a1aa65dd7489b
  23949d6593e310bfde593ad007a82f2cc1c1cbcbc5eeabe0fa935c07a0482a9125aff090a5f2f4e67885cb1c16578dfb15e93b878ff8eb2fe053aca984823f30
)
md5sums=(
  9f8cd934fc20ab20958a8224739e6588
  4251d3264dacf31e6c3cd19cdae03c37
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
