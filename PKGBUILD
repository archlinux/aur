#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=tiv
pkgver=2015
pkgrel=4
pkgdesc='A simple image viewer that displays images directly in the terminal.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/tiv"
depends=(imagemagick perl)
optdepends=('jp2a: ascii character output')
source=(
  https://xyne.dev/projects/tiv/src/tiv-2015.tar.xz
  https://xyne.dev/projects/tiv/src/tiv-2015.tar.xz.sig
)
sha512sums=(
  58efc74fb20221c1b69dc0589bbbd827bbdf900300284221a32a71b0cf39971d37b427edf94eb23a533c9ada9cf72fc58e72e45bef420195e181eda27dafa7c6
  bea7569efe5802f7ee88e0e782f16db6952ce2a6e78a613c948cef69095e1926a0bb24b9cddba30c1a8f6dac056a6a005b037093dac83172165a0740884ed685
)
md5sums=(
  c875dba27bfc2cdc702c108922d9bf59
  b7184e071a2baa4be98808f9adea5930
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
