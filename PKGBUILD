#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=quixand
pkgver=2020
pkgrel=1
pkgdesc='A tool for creating single-use unrecoverable encrypted sandboxes.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/quixand"
depends=(encfs)
source=(
  https://xyne.archlinux.ca/projects/quixand/src/quixand-2020.tar.xz
  https://xyne.archlinux.ca/projects/quixand/src/quixand-2020.tar.xz.sig
)
sha512sums=(
  15b3d14337f994843db35b6f3a85d670a6df4819e31df18cc4f5e9ec7981b01628a059a7bc16145b0807fa61b8c04a1a98090fff7cc580bd5af5d6ab9bd27901
  b935f27ba5ea75edd73d562917e28e128e1c5e79bd7e13f74cd3aa43ac8d274506d0da480ea8c82a5e3a7bf3b87ae2dc2aade9bf9a316f013cfef21c19910309
)
md5sums=(
  462656113d86e837a4918dfb8431cfe6
  7030a3ddf7a5e4c6c9587277b0be710b
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
