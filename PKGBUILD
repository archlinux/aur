#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2017
pkgrel=6
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/obfilebrowser"
depends=(mimeo python-xdg python3)
source=(
  https://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2017.tar.xz
  https://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2017.tar.xz.sig
)
sha512sums=(
  2f08798791849e2cc2fb4866649fac6a0429775ba7eeec7120ea18b6f6107a86a4cb5591729906198e02fd66234e1f732bb957f9772d231b44dd5fc9d0477479
  aa16d960090f333857f54db992c438b9dd7b3d674a9eeb14e461fce9d298cec798ad91c5dcc46e507aa5b5a4403e2fddc6be9e9872db662037c249d4a7951855
)
md5sums=(
  0e2a4b71ace5f7a03563d7566cfc7d75
  16c33d0c4990029652bbe0760f1d4c16
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
