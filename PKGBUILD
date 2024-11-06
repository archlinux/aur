# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-sponsorblock-for-youtube-skip-sponsorships-bin'
pkgver=5.9.5
pkgrel=2
pkgdesc='Easily skip YouTube video sponsors.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4372080
source=('sponsorblock.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/sponsorblock-${pkgver}.xpi")
noextract=('sponsorblock.xpi')
sha256sums=('038d23a8ad7620817f5f96d883c03771208b80500273a61e63017bbaed875741')

package() {
  install -Dm644 'sponsorblock.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/SponsorBlock@ajay.app.xpi"
}
