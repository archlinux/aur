# Maintainer: Stick <nstickney@pm.me>
# shellcheck disable=SC2034,SC2154
pkgname=noto-fonts-all
pkgver=20181224
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
sha256sums=('4a4a4179a96b5ef6786186d199f0d049b151352f460b8d2f3c00083792f37dd9')

package()
{
	cd "$srcdir" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
