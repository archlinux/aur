#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=xrandr-mgr
pkgver=2013.7
pkgrel=4
pkgdesc='Save and restore named xrandr states.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/xrandr-mgr"
depends=(arandr bash-statemgr)
source=(
  https://xyne.dev/projects/xrandr-mgr/src/xrandr-mgr-2013.7.tar.xz
  https://xyne.dev/projects/xrandr-mgr/src/xrandr-mgr-2013.7.tar.xz.sig
)
sha512sums=(
  58006516b51912f36bb21822963c429285c7d07a5da2b1d7e169b552cfb109f069fa89f7532701341d9ca3234b6e0e8c01cae94a062148fcec6bbdf627ebe9f4
  997e4d8988bc3d937f7da6debe7bcb2abca77a11ade0e4d2b2729384c4792f97555d27fffd97a4cec5b7de4c049387979d9c863c72062fb78de72301aef4df76
)
md5sums=(
  6bd046ee31b365ea13967580bc3509c9
  7782fe8573898996edefa01aca614ddb
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
