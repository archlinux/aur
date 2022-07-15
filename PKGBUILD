#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pystopwatch
pkgver=2019
pkgrel=4
pkgdesc='A stopwatch written in Python with a clock and two countdown functions that can minimize to the tray.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pystopwatch"
depends=(gtk2 librsvg pygtk python2)
source=(
  https://xyne.dev/projects/pystopwatch/src/pystopwatch-2019.tar.xz
  https://xyne.dev/projects/pystopwatch/src/pystopwatch-2019.tar.xz.sig
)
sha512sums=(
  bfe88dd238c08b3b36f3789994e8cd30787e8cc1ee17bc8005828a2f5816b6d6c26b721899dcc5da8e867147bbc6acb5f3d86c623b6e9bd9ef23df2a41a1c52c
  be6ecb92f874128232c51b5b62749a3a423337d83f0fa90e84a9b490cd9c51304fd04ed6c2a5cc39ca04372431090602242d65318b70528a33b393dd96000be8
)
md5sums=(
  636cb26bcb89cd1344d9dbbed47a77fb
  f5710a67a45e7d8823e4252d56c58a19
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
