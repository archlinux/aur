#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2017.1
pkgrel=1
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/xac"
depends=(haskell-pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  http://xyne.archlinux.ca/projects/xac/src/xac-2017.1.tar.xz
  http://xyne.archlinux.ca/projects/xac/src/xac-2017.1.tar.xz.sig
)
sha512sums=(
  13e848187b87c3d29e7905b3beb02be35835a9c5b1de0156030e865c32da736b8acfba2202201c71e7473a497a035c8c25bf26ecac30ebe42b395bd339a80a23
  337be4f8df1f7dee256564219a66e26fa4dedc7bfc85dc124c7cd09152eb00a62ed834b07a63e390d59b0d038c2903d1e9179b55c9c3d6b2b53012abd886e280
)
md5sums=(
  fe331bc6790c0d7e4ece3be0b8a6d5e5
  015a319ff5d93a555f09e9bc082ebdcd
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
