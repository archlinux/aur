#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2016.1.18
pkgrel=1
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/obfilebrowser"
depends=(mimeo python-xdg python3)
source=(
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.18.tar.xz
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.18.tar.xz.sig
)
sha512sums=(
  b4b1ca4562dbf18ab7208764dc9662dd34cd25b8fc184c6480cee0448918891387e2af6b4d6e0bbc3f909b0ed55e7a3a22da84aacbec3788e1419223c806e86e
  2a1f43dd88cef5c6e48a1aae501257fe80774785bfc772f2c413280d6adc8d0d9118cc291b2090071f910164082b7f79ed8a8f171e4d7ed1edfc15c947bac19f
)
md5sums=(
  799b5acced5b6dae8b13815f72d3febd
  b9428679a2e1573ca8f1d1a201a9f2ba
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
