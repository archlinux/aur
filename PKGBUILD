#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.13.4
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.13.4.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.13.4.tar.xz.sig
)
sha512sums=(
  8370284d866abd8821b56dc6eb42e7dd2eb2bdb57cefbfbf08585952442bdd58ff55a228ff6aa6ebea145d74e2bf7ec3147fad1a2eb324229c1013f178138d6e
  a791220c2a6a6d2ba74844e261b3d4110804feae095ce81c1eca25e6991f96f9c8f6ce15828de2fcd55dcbfb3b81bb91079320c76bbf9af677038a637ec4f814
)
md5sums=(
  d793cb500ec65e286ce072f7028d8f3e
  24c47ad687848b2567310aa0a1f2dc89
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
