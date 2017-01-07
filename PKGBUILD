#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2017.1.7.1
pkgrel=1
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/xac"
depends=(haskell-pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  http://xyne.archlinux.ca/projects/xac/src/xac-2017.1.7.1.tar.xz
  http://xyne.archlinux.ca/projects/xac/src/xac-2017.1.7.1.tar.xz.sig
)
sha512sums=(
  5e1c4a8502d5362ec1e52a169e72b172a15037b2ac7a98eb4b5f1d6624e2871f76d737c333da70800f5767e26cd6edcc71e1978b6d1ec3a374bfbbb0847c368b
  4281a3ca29baa47dc5b22f2b633a533dac658f0b304f791c3e67a52f028b32f4fb8a9431b31ca67e57bdde9e9f98b36ce182afd8363016fc1edacf37031afdf1
)
md5sums=(
  27413cb9d69c215e87465411f46cad32
  65bd7d6ab367f16be64338808d02a695
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
