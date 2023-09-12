# Maintainer: maximalmax90 <maximalmax90@mail.ru>
pkgname=vs1clickmodinstaller-native
_altname=vs1clickmodinstaller
pkgver=0.1
pkgrel=1
pkgdesc="VintageStory 1-click install handler (native implementation)"
arch=("any")
url="https://github.com/maximalmax90/vs1clickmodinstaller"
license=('GPL-3.0')
source=("https://github.com/maximalmax90/vs1clickmodinstaller/archive/refs/tags/v${pkgver}-native.tar.gz")
sha256sums=('c183c641d375cd529798cf5d1cbcb316457e3bbcb11cbea8a3bb199913910547')
conflicts=("vs1clickmodinstaller")

package() {
	install -Dm644 "${_altname}-${pkgver}-native/${_altname}".desktop "${pkgdir}/usr/share/applications/${_altname}.desktop"
}
