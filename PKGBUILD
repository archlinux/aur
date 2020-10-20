# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='street-cred'
pkgname="ttf-$_projectname"
pkgver='20140616'
pkgrel='1'
pkgdesc='Dual-stripe geometric headline font'
arch=('any')
url="https://typodermicfonts.com/$_projectname"
license=('custom:Typodermic EULA')
source=("$pkgname-$pkgver-$pkgrel.zip::https://dl.dafont.com/dl/?f=street_cred")
sha256sums=('f8b3ea1ce97cea3b7698e7ed1a5015da74e1c23550c99bc19f9bf39dfcee6dac')

package() {
	cd "$srcdir/"
	install -Dm644 'street cred.ttf' "$pkgdir/usr/share/fonts/TTF/StreetCred.ttf"
	install -Dm644 'typodermic-eula-02-2014.pdf' "$pkgdir/usr/share/licenses/$pkgname/typodermic-eula-02-2014.pdf"
}
