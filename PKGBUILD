#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.14.4
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.14.4.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.14.4.tar.xz.sig
)
sha512sums=(
  eb63f67cc5f8a42427653e8e2bec55514c78780a48b0f35393e57acb88afae756ad56871ee5b6b511b4e1e436dd76b186fa6a20c20c0d49329e08de2b92e53a3
  42925a997a9b5e2f405dd977aa2014f9f29e28b0a17f463206e0d87be987996af8666780e1f76a4fb4e0fde08739866ec13c829fb95a60b5d7d3ff5e5fc3ba4a
)
md5sums=(
  eeed48030a11317c536df9fbb3cbaf44
  5155d1d274cc4d0e95808ebd80ac667d
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
