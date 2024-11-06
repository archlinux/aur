# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-privacy-badger-bin'
pkgver=2024.7.17
pkgrel=1
pkgdesc='Automatically learns to block invisible trackers.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4321653
source=('privacy_badger.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/privacy_badger17-${pkgver}.xpi")
noextract=('privacy_badger.xpi')
sha256sums=('f7afc15d305966bafc9215f600acb0815c84402b7b8c763493387d19415deb0d')

package() {
  install -Dm644 'privacy_badger.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/PrivacyBadger@privacybadger.org.xpi"
}
