#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2016.1.21
pkgrel=1
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/obfilebrowser"
depends=(mimeo python-xdg python3)
source=(
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.21.tar.xz
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.21.tar.xz.sig
)
sha512sums=(
  c3426e74f4dfd91a19f6106ad6a449976e1992bbea4e1f5103ac39492d4e78bf690fa7cdb3cda3d3aebde4153f47fb928942ea4b25cb2aad6543308fcc3ac732
  f1ee2a716e454f9e30d433c5ac93bd8d6a96533ec071d899d98620396b03de5a19163275ac10a2449190eae534ce884772d7662e1367e475633534f587836ae7
)
md5sums=(
  035e65b6af1c6f6e1e6913b8c11e7bfb
  7e3477c13a51eafc2f532d3b34ae6b47
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
