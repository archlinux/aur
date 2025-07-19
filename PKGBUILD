# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=firefox-sponsorblock-for-youtube-skip-sponsorships-bin
pkgver=5.13.3
pkgrel=1
pkgdesc='Easily skip YouTube video sponsors.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4535341
source=('sponsorblock.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/sponsorblock-${pkgver}.xpi")
noextract=('sponsorblock.xpi')
sha256sums=('700f687e4ad76ef40c28d89450cbd9237887fd18c8e81ff4ea3fe2326e9962c4')

package() {
  install -Dm644 'sponsorblock.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/sponsorBlocker@ajay.app.xpi"
}
