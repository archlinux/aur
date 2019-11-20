# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=ttf-oppo-sans
pkgver=1.00
pkgrel=1
pkgdesc="Oppo's new brand font, free for business use."
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=("https://static01.coloros.com/www/public/img/topic7/font-opposans.zip?194")
md5sums=('3fa55b469f66e74d6dc291d928b7d7bb')

package() {
	install -d "${pkgdir}/"usr/share/fonts/"${pkgname:4}"
	install -m644 "${srcdir}/"Font-OPPOSans/*.ttf "${pkgdir}/"usr/share/fonts/"${pkgname:4}"
}
