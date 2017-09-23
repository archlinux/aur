# Maintainer: Mcnster <me@mcnster.com>
pkgname=hotp-totp-php
_prjname=HOTP-TOTP.PHP
pkgver=4.4.1
pkgrel=1
pkgdesc="PHP tool to create one-time passwords via HOTP, TOTP, OCRA, OAuth 1.0a 2.0; rfc4226, 6238, 6287, 5849, 6749"
arch=('any')
url="https://sourceforge.net/projects/hotp-totp-php"
license=('Apache')
depends=('php')
makedepends=()
source=("https://sourceforge.net/projects/$pkgname/files/v$pkgver/$_prjname.v$pkgver.zip"
"README")
sha512sums=('264d1aceb6151eb8ebce2a10ad32d6d41101954ef34404feba8b3171b92385fe660926ffab93d01fe47b39c99f4dee422adaad8bab64aedef276d787cfffb5b6'
'4e5cea1b82e32a011bdf6f9e13349a26e2caeb4bf70e1dfd3440e53e36949b55f3d354c8c24e5c507eac3fa3b6135d7363d110de26369125d44a491416673d33')
validpgpkeys=()

package() {
	mkdir -p $pkgdir/usr/share/$pkgname
	cp README $pkgdir/usr/share/$pkgname
	cd $srcdir
	cp index.php $pkgdir/usr/share/$pkgname
	cp index_oauth2.php $pkgdir/usr/share/$pkgname
}
