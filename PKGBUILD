#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2015.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(python2 python2-xdg file)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2015.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2015.1.tar.xz.sig
)
sha512sums=(
  128af7d619b28015f928b06fd3d2f48e0818f84b3045a8c99ca2083952f5a9a1bbe62d8f8366e25f2bd3e25385481870cc25851fa081e60a857714cc7c65ef75
  8efbec10f3196f15cc17fdb269a59c6606588a237e39cd806c4ec6ce5b05343ec2ea7b7ab07453a82444667d98540e857b1e1ddd967305530b70b3f9647b3c5a
)
md5sums=(
  c5c3465e9471227b845afe4fffedf6f3
  155a610f584184aafe3aeb5d9be02087
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
