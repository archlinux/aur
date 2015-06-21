#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bash-xyne-common_functions
pkgver=2012
pkgrel=2
pkgdesc='Xyne'"'"'s commonly used bash functions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bash-xyne-common_functions"
optdepends=('wget: for webpage interaction' 'curl: for webpage interaction')
source=(
  http://xyne.archlinux.ca/projects/bash-xyne-common_functions/src/bash-xyne-common_functions-2012.tar.xz
  http://xyne.archlinux.ca/projects/bash-xyne-common_functions/src/bash-xyne-common_functions-2012.tar.xz.sig
)
sha512sums=(
  13c37b9a4f0008134112a3aa6d7f590e8fb48f45ef7be3e41c1cbad9bbfc1eb800e56235bef96d77b3fcfb449c9ba4ee3ca92e9aea0a93b2d3a45b4a7189e46d
  c567b99ca2168e0c6c74a22af2302b8a2c3633306ea71d7c2ad7a5119e2763558eb428ad4b950418eecf961a62fc53483ac8cebc1dbd147885e161271f45c84f
)
md5sums=(
  b82824c039d81768fb1d581a8c83554e
  c702c665a3c1795a7b9cec376afaf854
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  _file="common_functions"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$_file" "$pkgdir/usr/share/xyne/bash/$_file"
}


# vim: set ts=2 sw=2 et:
