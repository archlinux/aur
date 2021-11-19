# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Janghyub Seo <jhyub06 at gmail dot com>

pkgname=zoom-libkime
pkgver=2.5.6
_qtver=5.12.8
pkgrel=1
pkgdesc="Kime library for zoom multilingual input."
url="https://github.com/Riey/kime"
arch=('x86_64')
license=('GPL3') 
depends=('zoom' 'kime')
source=("https://github.com/Riey/kime/releases/download/v${pkgver}/libkime-qt-${_qtver}.so")
sha512sums=('afeeb4fcfde8c70ac445fb420ba97db8258e8027001c6c18fe638b517f83d81744baf9b9727dab92e88f0db9108707c976b82a6f83aae79a00d1b139f081729d')

package() {
	install -dm755 ${pkgdir}/opt/zoom/platforminputcontexts
	install -m755 libkime-qt-${_qtver}.so "${pkgdir}"/opt/zoom/platforminputcontexts/libkimeplatforminputcontextplugin.so
}
