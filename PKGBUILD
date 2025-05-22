# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-sponsorblock-for-youtube-skip-sponsorships-bin'
pkgver=5.12.1
pkgrel=1
pkgdesc='Easily skip YouTube video sponsors.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4480833
source=('sponsorblock.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/sponsorblock-${pkgver}.xpi")
noextract=('sponsorblock.xpi')
sha256sums=('1ba2e6f90f64281397c131f8cd195faa01832600bee19ec3b93dce9366cfa96e')

package() {
  install -Dm644 'sponsorblock.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/sponsorBlocker@ajay.app.xpi"
}
