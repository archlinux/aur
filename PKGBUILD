#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.1.25.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.25.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.1.25.1.tar.xz.sig
)
sha512sums=(
  5d56f1b789165a0302e3e88f7cc80c592fdec988469ea3a4abeffa52d3926e34bd5cae961a9647eeaa6209509a05e1885dcc21287688f9860bb158d2062c5b89
  e7453821d503d6ca4dd813159e4f570b0205a2e6dd95f3260f6287207f5dc468ff96a2e228c4cb1703d4b4def503682205bdf9bc2a541fc2373c12def3f15333
)
md5sums=(
  c3858a2125c625fb12f402e685d934b5
  570a0ba438c70a7b8de509fa37caaddb
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
