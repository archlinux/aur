# Maintainer: Stick <nstickney@pm.me>
# shellcheck disable=SC2034,SC2154
pkgname=adobe-source-pro-fonts
pkgver=20181124
pkgrel=1
pkgdesc='Meta package of Adobe Source Pro fonts in the official repositories.'
arch=('any')
url='https://aur.archlinux.org/packages/all-repository-fonts/'
license=('custom:Public Domain')
depends=('adobe-source-code-pro-fonts'
         'adobe-source-han-sans-cn-fonts'
         'adobe-source-han-sans-jp-fonts'
         'adobe-source-han-sans-kr-fonts'
         'adobe-source-han-sans-otc-fonts'
         'adobe-source-han-sans-tw-fonts'
         'adobe-source-han-serif-cn-fonts'
         'adobe-source-han-serif-jp-fonts'
         'adobe-source-han-serif-kr-fonts'
         'adobe-source-han-serif-otc-fonts'
         'adobe-source-han-serif-tw-fonts'
         'adobe-source-sans-pro-fonts'
         'adobe-source-serif-pro-fonts')
source=(LICENSE)
sha256sums=('cb30d3086a8b3ce0b9e3690bf48d6620402b61160bc658076f95180ccd9e9dae')

package()
{
	cd "$srcdir" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
