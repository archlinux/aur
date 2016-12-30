#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2016.12.30.1
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.30.1.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2016.12.30.1.tar.xz.sig
)
sha512sums=(
  a0c0e94a677f3427e9bc5ce057c216eb795141f275296baf971fe1986b82eb5d7aa26fabacf2e611b8d9ea131d119b36692b30d5de0733b803f518900601a49d
  993c044340bf57619192621de8b6c209576e24dede96b96826ed3ba21f55e39ab67e04bdf6c8e5627ea08e6d162a91fefd41a9517b23e75d0f1a5f8c37d8d5c1
)
md5sums=(
  27cc5a00073365d8466c7e0a03549e7b
  9f6249fee46990f632e6c90e367da6bf
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
