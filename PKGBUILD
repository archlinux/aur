# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_theme_type=xfwm4
_theme_name=freshdark
_theme_url="http://xfce-users.deviantart.com/art/FreshDark-XFWM4-98819225"
_theme_name_u=FreshDark

pkgname=${_theme_type}-theme-${_theme_name}
pkgver=1
pkgrel=0
pkgdesc="gtk theme inspired by the name of Silicon Valley American teledrama."
arch=('any')
url=${_theme_url}
license=('NC SA 3.0')
depends=('xfwm4')
source=('http://orig08.deviantart.net/d8d6/f/2008/267/2/9/freshdark_xfwm4_by_jmcknight.gz')
sha256sums=('60709f6d5a15540edbfc81406703c03435fa4db67baf531ca560a4f61a5773d0')

package() {
	cd "${srcdir}/${_theme_name_u}"
	find . -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/${_theme_name_u}/{}" \;
}
