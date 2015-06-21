#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obfilebrowser
pkgver=2012.12.24.1
pkgrel=4
pkgdesc='An Openbox pipe menu application and file browser.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/obfilebrowser"
depends=(python2 'mimeo>=2011.03.12')
source=(
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2012.12.24.1.tar.xz
  http://xyne.archlinux.ca/projects/obfilebrowser/src/obfilebrowser-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  31ab38baa7f7508aa9b2a18855c4efa5096e4fd19997536ae05b56e490228cba603218fa17bc7575409d4e6b4a5dfc28bb226eec04b878c6cf0a10b051c47983
  c47b41774e86591b42d6f85502bcd24f99b9f981b1f906965feb118bd1fc68c65d3b2ce06c75c0eb773c13e8b55095646fcf973341141e6b9c08820aa3bdf4fc
)
md5sums=(
  ff382dd7d6f726dc3a3bff96702a5f66
  c9c65155c99010c73e6f7eefddd18e0c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
