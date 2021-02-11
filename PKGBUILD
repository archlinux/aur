# Maintainer: Kian Kasad <kian@kasad.com>
pkgname=firefox-extension-sponsorblock
pkgver=2.0.12.3
pkgrel=1
pkgdesc="SponsorBlock extension for Firefox"
arch=('any')
url='https://github.com/ajayyy/SponsorBlock/'
license=('GPL3')
groups=('firefox-addons')
depends=('firefox')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3720594/sponsorblock_skip_sponsorships_on_youtube-$pkgver-an+fx.xpi")
sha256sums=('1d1b679995b25cddcc2a8e00bd26203491a4044b1ad9168c6a615b933f98cd08')
noextract=('extension.xpi')

package() {
	install -Dm0644 extension.xpi "$pkgdir/usr/lib/firefox/browser/extensions/sponsorBlocker@ajay.app.xpi"
}
