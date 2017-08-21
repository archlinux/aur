#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2017.7
pkgrel=1
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/xac"
depends=(haskell-pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  https://xyne.archlinux.ca/projects/xac/src/xac-2017.7.tar.xz
  https://xyne.archlinux.ca/projects/xac/src/xac-2017.7.tar.xz.sig
)
sha512sums=(
  52d9f851a241bfc652a31557bb8c21f949f894ecc3564f392fb741f9d68ae8755ebf3734e027dfc5b8724b64dbc7c0bd53c8a0c5cec9d9520f667a9a60a4ea91
  49b79d5cb81e27adfa119509ad17ed78806b6ab0e9352b50e84d6283c0347ca506ef0f5a4bc484abe5fc9ba46687a66b0ec996535b92208ad6a05bdca1c93083
)
md5sums=(
  2d0313a56c114c1135d6c5223a9d306a
  1a64ab1ae6e9593967a32a634c8c35f1
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
