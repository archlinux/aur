# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-sponsorblock-for-youtube-skip-sponsorships-bin'
pkgver=5.10.5
pkgrel=1
pkgdesc='Easily skip YouTube video sponsors.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4410322
source=('sponsorblock.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/sponsorblock-${pkgver}.xpi")
noextract=('sponsorblock.xpi')
sha256sums=('219e58141efd775fe0c549e3a225d7897616de5880cacc1b21e460f81042b1cb')

package() {
  install -Dm644 'sponsorblock.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/sponsorBlocker@ajay.app.xpi"
}
