#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2016.1.17
pkgrel=1
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/obfilebrowser"
depends=(mimeo python-xdg python3)
source=(
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.17.tar.xz
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2016.1.17.tar.xz.sig
)
sha512sums=(
  e29fa929990c7fcc75e89f81d72f73f81c460648b075240a5f5c6346be47158a1cf3052521511650a10020dabbcbaafa30a7cf66179a1a663da7f1ed1972f1a2
  d22619269313e7de7c9545f44c991ede575ff4515426183534de844411d0897125fbea08097e2a689345d48ce5b6cf3b219dcef28d4beea1320c80908496e204
)
md5sums=(
  3c1f509b766f53ee27cf527ce5a753c8
  84f5d7c003215cdb2cd843ddddcd07f8
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
