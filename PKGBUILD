#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2019.7
pkgrel=2
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('shared-mime-info: for recognizing more MIME-types')
source=(
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2019.7.tar.xz
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2019.7.tar.xz.sig
)
sha512sums=(
  0a6c09a81791e30ec3cbb1fc7756e4018ac2862b304b3941fd612f32fe0c2b843b218c6b88e9ceadcca0ca1fb117a8d4c6f7899c7c0210ab99d145ad186b8924
  50bef05a9dc12170b048d539800c7e1e57e70496ba4b7ed5c3fd1856451e02b1930008adeaec132f3684ae34be698f27d88d5afb1ab2ae2e78a6ed181fb89a10
)
md5sums=(
  4df389f20aba356a178786c6b57645f5
  1f1a77fef89de102a98cc089a09c96c9
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
