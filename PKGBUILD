# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Janghyub Seo <jhyub06 at gmail dot com>

pkgname=zoom-libkime
pkgver=3.0.1
_qtver=5.12.9
pkgrel=1
pkgdesc="Kime library for zoom multilingual input."
url="https://github.com/Riey/kime"
arch=('x86_64')
license=('GPL3') 
depends=('zoom' 'kime')
source=("https://github.com/Riey/kime/releases/download/v${pkgver}/libkime-qt-${_qtver}.so")
sha512sums=('4e2d246b1dbe11c66dc215a959cbed33c36305440f284fc8545a2910aac32a5d494b5a2d62e9885335abe99dad4c6c032099f8e81284e61a810902fefdec33e3')

package() {
	install -dm755 ${pkgdir}/opt/zoom/platforminputcontexts
	install -m755 libkime-qt-${_qtver}.so "${pkgdir}"/opt/zoom/platforminputcontexts/libkimeplatforminputcontextplugin.so
}
