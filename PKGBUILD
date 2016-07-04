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
sha256sums=('1afdfb021a1c95b47d23186dc709a0f35c4fbb8d909160bbd4205d244c780a33')


package() {
	cd "${srcdir}" && chmod +x "${pkgname}"
	install -dm755 "${pkgdir}/usr/bin/" && cp "${pkgname}" "${pkgdir}/usr/bin/"
}
