#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=makedep
pkgver=2014.8
pkgrel=6
pkgdesc='Convert Pacman optional dependencies to real dependencies.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/makedep"
depends=(pacman pyalpm python3)
source=(
  https://xyne.dev/projects/makedep/src/makedep-2014.8.tar.xz
  https://xyne.dev/projects/makedep/src/makedep-2014.8.tar.xz.sig
)
sha512sums=(
  e79b5452ce40cc01fdb1c41d902867a3ccf8542fba001218ddca3463d750c741ee40552b6196bccdd3d22084203221ed6e82d5b1bdf83fa231c913c208b7a380
  90d0175adbf4eeeefb5b47b2331900bd0201f151879e06220e2d77bbdfff82803df59a805c5ab879c84d1de40f0a27297feef4db479a1e912ee6b97ff6f5f103
)
md5sums=(
  29eb84996e6c08a500b87046cd54fc54
  a2b3d23c39c014ed2f3db3852a20f76e
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
