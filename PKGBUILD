#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=recollect
pkgver=2013.10.6
pkgrel=1
pkgdesc='Keep local copies of remote files updated.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/recollect"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/recollect/src/recollect-2013.10.6.tar.xz
  http://xyne.archlinux.ca/projects/recollect/src/recollect-2013.10.6.tar.xz.sig
)
sha512sums=(
  50485c2767f7770036c13a233c87609d0f36862a790a8c9113400ce6b7414b2327bd21395d593f1bbfac9f98ae369f1c460e860b83deeb676b12e69ce06897a1
  128f75bc2d49000ba3291d426b05220f2093550c654138b15c443c214c57e62a574733edeefa74843177c12617764b2f41066051f0911bd604acf7dd6bc9a1a2
)
md5sums=(
  8eab33a4edea1ec0b87427fd51e85a58
  4357cdb4ca41515d8d48d76b6e6edc72
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
