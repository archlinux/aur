#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=quixand
pkgver=2020
pkgrel=4
pkgdesc='A tool for creating single-use unrecoverable encrypted sandboxes.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/quixand"
depends=(encfs)
source=(
  https://xyne.dev/projects/quixand/src/quixand-2020.tar.xz
  https://xyne.dev/projects/quixand/src/quixand-2020.tar.xz.sig
)
sha512sums=(
  15b3d14337f994843db35b6f3a85d670a6df4819e31df18cc4f5e9ec7981b01628a059a7bc16145b0807fa61b8c04a1a98090fff7cc580bd5af5d6ab9bd27901
  25d8a506f9ee2355e48d7c6a3219af2dcc69daf14806e30aaac13a56ad736513009fa17146c37e2e95fc2a0fbae6fb7d6b6db8bfdabff97ee6d342de346eda03
)
md5sums=(
  462656113d86e837a4918dfb8431cfe6
  ee175d40aa25f9d0dcd3b306883dafeb
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
