#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=svn-export
pkgver=2013.1.30
pkgrel=2
pkgdesc='An svn export emulator with support for incremental exports.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/svn-export"
depends=(python3 subversion)
source=(
  http://xyne.archlinux.ca/projects/svn-export/src/svn-export-2013.1.30.tar.xz
  http://xyne.archlinux.ca/projects/svn-export/src/svn-export-2013.1.30.tar.xz.sig
)
sha512sums=(
  c1ff3781fa3200528699203c8fa01c6b84655e95ef75163ebbaab21bf5918021eaddf8a12ddeac469633e74d77be47a399f73198624f6188e1a266d6737af37c
  dfb2819c9f77e227f329d945ba2466f078f062a7fd79b2ec503b60d7d618a2f175ee6b21752a6d1955abedfce536d58c639224e46c51933db0413c2b868767b5
)
md5sums=(
  9ae1866e3197590ac0f288d3da3cc144
  cd57071964216d794db6c6d6083d1ced
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname";
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
