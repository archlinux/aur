# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='jeeves'
pkgver='0.1'
pkgrel=1
pkgdesc='A simple script to quickly check your AUR packages'
arch=('any')
url='https://github.com/christopherloen/jeeves'
license=('None')
depends=('wget' 'cower' 'git')
source=('https://raw.githubusercontent.com/christopherloen/jeeves/master/jeeves')
sha256sums=('71d06b294e446e267d3a716938b2999ee1625b5c80bf1ccd43db5999c650872e')


package() {
	cd "${srcdir}" && chmod +x "${pkgname}"
	install -dm755 "${pkgdir}/usr/bin/" && cp "${pkgname}" "${pkgdir}/usr/bin/"
}
