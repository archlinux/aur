# Maintainer: kobe-koto <k@koto.cc>

pkgname=grub-theme-lain
_theme=Lain
pkgver=1.0.1
pkgrel=1
pkgdesc="Lain Grub Theme"
url="https://github.com/uiriansan/LainGrubTheme"
arch=('any')
license=('GPL-3.0')
depends=('grub-common')
source=("${_theme}GrubTheme-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fac303b92cb3b3342ccafd3df72aaa91944819858fd3ac3455f10efdfceab241')

package() {
	install -dm755 ${pkgdir}/usr/share/grub/themes
	cp -rf --no-preserve=ownership "${srcdir}/${_theme}GrubTheme-${pkgver}/" ${pkgdir}/usr/share/grub/themes/${_theme}
}
