#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2017.6
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.6.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2017.6.tar.xz.sig
)
sha512sums=(
  1a72293623cb685900541d43a4dd1a47819739c18960240a456e42542ed0c1250edd2a5cecf5df5db44233f0f69dd8bebade422aac8e388a6f3d792bdc3cab57
  98c2bb22d478f51a33e22ee5558b4282102b9f20c442dabb09cabfb0a514f6d32486bf654d88adad6739cbff498f611c0f38baa54bab5b9a4083c8ff5b1dbe13
)
md5sums=(
  722545456ffaed732623d7bbe864a64d
  c5bab15f6e0264d4ef21ade91c52b2f3
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
