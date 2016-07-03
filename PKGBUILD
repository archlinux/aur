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
sha256sums=('b094fc67740e1c1bcf03f2247920862ee679b7a52e0804be200f216932bf22e9')


package() {
	cd "${srcdir}" && chmod +x "${pkgname}"
	install -dm755 "${pkgdir}/usr/bin/" && cp "${pkgname}" "${pkgdir}/usr/bin/"
}
