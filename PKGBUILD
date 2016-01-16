#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2016.1
pkgrel=1
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/obfilebrowser"
depends=(mimeo python-xdg python3)
source=(
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.tar.xz
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.tar.xz.sig
)
sha512sums=(
  120300cbbac2daa368ffc5ecb9363043c3606061a04735effb56c158182d95252f25e6e5b4ad21bba30b07a67fceea22797c06dcebf6e2d561847482ac0a163d
  55999acdb033fb67210f4f0af14e4442b7405a33e27acf07752ac1ae42641daad8d924608298c98f6248e784760d1bf8235b5b5636a5c6fc7288e9ee154ff709
)
md5sums=(
  9608e847c779c454b25fefe4d9322277
  af4f3d1adf4c5c20c01358bb013a6b5b
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
