# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Kyle McNally <kyle@kmcnally.net>
# Contributor: Matt Aitchison

pkgname=('plex-sub-zero')
pkgver=2.6.5.3223
pkgrel=3
pkgdesc='Subtitles for Plex, as good you would expect them to be'
arch=('any')
url='https://github.com/pannal/Sub-Zero.bundle'
license=('MIT')
options=('!strip')
depends=('python' 'plex-media-server')
source=("https://github.com/pannal/Sub-Zero.bundle/archive/${pkgver}.tar.gz")
md5sums=('95d0a3649a901ad23f69f9957c9086f0')

package() {
	install -D -m644 "${srcdir}/Sub-Zero.bundle-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins/Sub-Zero.bundle"
	cp -r "${srcdir}/Sub-Zero.bundle-${pkgver}"/* "${pkgdir}/var/lib/plex/Plex Media Server/Plug-ins/Sub-Zero.bundle/"
}