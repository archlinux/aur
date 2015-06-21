#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=tiv
pkgver=2013.2.23
pkgrel=2
pkgdesc='A simple image viewer that displays images directly in the terminal.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/tiv"
depends=(perl imagemagick)
optdepends=('jp2a: ascii character output')
source=(
  http://xyne.archlinux.ca/projects/tiv/src/tiv-2013.2.23.tar.xz
  http://xyne.archlinux.ca/projects/tiv/src/tiv-2013.2.23.tar.xz.sig
)
sha512sums=(
  94359083681b3064330a631ab94e72f9d4656dcb0a3fdb24ccf2f18de533913c6eeab5e8aef879429029945c6f397a1dd7ba60af0926999805bb79d6bd422ac1
  9f7e27461e12b4699deb031d08fc5f49191bcae014f09f407ee30e4a34b7c585b049f90b49bb4ceab5b24fb9bca2300e2954e09d29f56aaabc549bf5a404314e
)
md5sums=(
  50b761eff93eef7bd8cae342fb514e70
  f660f50cbc6de6cc370ad759bbe14a4c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
