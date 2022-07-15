#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=svn-export
pkgver=2013.1.30
pkgrel=5
pkgdesc='An svn export emulator with support for incremental exports.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/svn-export"
depends=(python3 subversion)
source=(
  https://xyne.dev/projects/svn-export/src/svn-export-2013.1.30.tar.xz
  https://xyne.dev/projects/svn-export/src/svn-export-2013.1.30.tar.xz.sig
)
sha512sums=(
  c1ff3781fa3200528699203c8fa01c6b84655e95ef75163ebbaab21bf5918021eaddf8a12ddeac469633e74d77be47a399f73198624f6188e1a266d6737af37c
  0c2c1fa67f2d85c1f17b0c2e8adebee9de734111cf1dd36bd995e01bc294687f61ead873ab55f94f0ba2e11201894f1ac20bc669893ae855ee09324c9d8211ea
)
md5sums=(
  9ae1866e3197590ac0f288d3da3cc144
  cfc57220d664c7baf8c857d5ea666e39
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname";
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
