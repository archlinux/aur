#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.16.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.16.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.16.1.tar.xz.sig
)
sha512sums=(
  4443bb8cb5a79e0e824fbee044496bb7909fa1eec7b0b06d24f9e50a6c6e7f33a363cba76c00e967addc559fc9379f57627ad0ec73dcca55e99f64e1db48cc1d
  baf9242da7fd8487aaa20270085fd2d9e39f788905b1e5e4706a2888df072fff76b89f70e94311c66b74946bede374d8e9e546af6783afa4efbb1a71e39db3e8
)
md5sums=(
  149b19811ea8c2b9293e8f1ae348c7cb
  3726edf9da504375aa0cf014223198a5
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
