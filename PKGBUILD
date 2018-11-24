# Maintainer: Stick <nstickney@pm.me>
# shellcheck disable=SC2034,SC2154
pkgname=noto-fonts-all
pkgver=20181009
pkgrel=1
pkgdesc='Meta package of all Noto fonts in the official repositories.'
arch=('any')
url='https://www.google.com/get/noto/'
license=('custom:SIL')
depends=('noto-fonts'
         'noto-fonts-cjk'
         'noto-fonts-emoji'
         'noto-fonts-extra')
source=(LICENSE)
sha256sums=('cb30d3086a8b3ce0b9e3690bf48d6620402b61160bc658076f95180ccd9e9dae')

package()
{
	cd "$srcdir" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
