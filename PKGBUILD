#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.16.3
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.16.3.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.16.3.tar.xz.sig
)
sha512sums=(
  624b2cd6d01ba72d3cc70139cde368ed9556b5362a6efda7b912c3542c38c753b874a2d01669bbcc782b3ddb70c369272a215669b96520aaf7588ee1e49a5cc5
  1b02ed06bbc60a67efb0f1ff2eea27c2aa3bbefdf7f54186a5646dbef5f70b51a8c3f92c151738e18b98030119ec50e3b189cfd5be4744567bc8bf6162e86372
)
md5sums=(
  cfed41da45d749e6a8683270ed449d20
  a6b5a59abc158d4b7d532efc8c7491bf
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
