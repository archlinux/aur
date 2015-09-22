# Contributor: Daenyth <Daenyth+arch AT gmail DOT com>
# Aur4 Maintainer: csllbr
pkgname=gpgdir
pkgver=1.9.5
pkgrel=2
pkgdesc="A script that uses gpg to encrypt and decrypt directories"
arch=(any)
url="http://www.cipherdyne.org/gpgdir/"
license=('GPL')
depends=('gnupg' 'perl-term-readkey' 'perl-gnupg-interface')
makedepends=('gzip')
source=(http://www.cipherdyne.org/$pkgname/download/$pkgname-$pkgver.tar.gz)

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  install -Dm755 gpgdir "${pkgdir}/usr/bin/perlbin/site_perl/gpgdir"
  install -Dm644 gpgdir.1 "${pkgdir}/usr/share/man/man1/gpgdir.1"
}

# vim:set ts=2 sw=2 et:
md5sums=('bf51ce0a01588d6e8d28f95d6d81cdd9')
