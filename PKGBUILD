#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=quixand
pkgver=2012.12.24.1
pkgrel=2
pkgdesc='A tool for creating single-use unrecoverable encrypted sandboxes.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/quixand"
depends=(encfs)
source=(
  http://xyne.archlinux.ca/projects/quixand/src/quixand-2012.12.24.1.tar.xz
  http://xyne.archlinux.ca/projects/quixand/src/quixand-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  da14408b1d45858515e16af8fe701a212d8b4e9a5aa3f689bb8a2dfba8f8b008b59d516e5457cdc2797844758cc3ac8561c4eada0ff226b2059a38a04fa74a70
  034e768b0638d32217cc3b019aa1ad58c71c5c2bc23bcd6e09cf800198c56f837532ed28d32d6292cf4121f7ea0dd5d106229200939c2aced0e8b50827b35a10
)
md5sums=(
  db96157ac01758dac586237d2454686a
  dfdbce0dd1e7261c4c00a0a4e510eb77
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
