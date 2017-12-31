#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2017.11
pkgrel=2
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/xac"
depends=(pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  https://xyne.archlinux.ca/projects/xac/src/xac-2017.11.tar.xz
  https://xyne.archlinux.ca/projects/xac/src/xac-2017.11.tar.xz.sig
)
sha512sums=(
  0d744e0238f073f194fef4f49d57d7427445ac3f0fcb5fbac1de97e0605ec444c29560780f5d5b9561fe4123025d006ef5a704f9a1db28e7ec0dede762239f4b
  88a0741d051f021365ca37e27d1d32ffb34523ea09b20fcb42a6d167f3f38390ea59b01ea47909fa8195e4153f281c9ad44cc7e96176421217e2c07633343942
)
md5sums=(
  29ce7a3cc23e8a11f023735b4c97e4df
  aa594c2dbcb2678f6ec581dacc9eb1fd
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
