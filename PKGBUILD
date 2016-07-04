# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='jeeves'
pkgver='0.3.1'
pkgrel=1
pkgdesc='A simple AUR helper to quickly install or upload packages'
arch=('any')
url='https://github.com/christopherloen/jeeves'
license=('None')
depends=('wget' 'cower' 'git')
source=('https://raw.githubusercontent.com/christopherloen/jeeves/master/jeeves')
sha256sums=('c94e2cac6109c301b60558331474fd33e4ce2dd16aa5419e501310b492a9bf06')


package() {
	cd "${srcdir}" && chmod +x "${pkgname}"
	install -dm755 "${pkgdir}/usr/bin/" && cp "${pkgname}" "${pkgdir}/usr/bin/"
}
