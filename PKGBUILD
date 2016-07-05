# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='jeeves'
pkgver='0.3.2'
pkgrel=1
pkgdesc='A simple AUR helper to quickly install or upload packages'
arch=('any')
url='https://github.com/christopherloen/jeeves'
license=('None')
depends=('wget' 'cower' 'git')
source=('https://raw.githubusercontent.com/christopherloen/jeeves/master/jeeves')
sha256sums=('48fd79552e27f4da43aaaf39cf46c21ec8f34a14ca0cf7acec407cf1ec5038c6')


package() {
	cd "${srcdir}" && chmod +x "${pkgname}"
	install -dm755 "${pkgdir}/usr/bin/" && cp "${pkgname}" "${pkgdir}/usr/bin/"
}
