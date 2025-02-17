# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-sponsorblock-for-youtube-skip-sponsorships-bin'
pkgver=5.11.5
pkgrel=1
pkgdesc='Easily skip YouTube video sponsors.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4424639
source=('sponsorblock.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/sponsorblock-${pkgver}.xpi")
noextract=('sponsorblock.xpi')
sha256sums=('4cb3a7061dbeb9869477fb2f991d39ccaf650941f83abe1e0c65511e971cb555')

package() {
  install -Dm644 'sponsorblock.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/sponsorBlocker@ajay.app.xpi"
}
