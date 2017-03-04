#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2017.3.4.2
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.4.2.tar.xz
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.4.2.tar.xz.sig
)
sha512sums=(
  fe23c788c57db08e66a39c23b4de276c0f7f00d9991d7d7a62d41eded03997ca80d3240d940a00c006aef261523718dbbc9e7fed9a0f3789dc4c4f554baf8243
  d36382866bf0d85e52085adf04c31cd656b42ee9f5d712a1ae70663a999bd10018cd43256a96ca7b671611d1e9a8e3a1a8cfbe2dbb10370981b0ee923016e7a1
)
md5sums=(
  542ce7e5676dac504ef59199054c59a1
  f8e096e1c06ab426d1dca1f5b59b7816
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
