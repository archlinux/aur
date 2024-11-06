# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-startpage-bin'
pkgver=2.0.2
pkgrel=2
pkgdesc='This extension protects users from being tracked while allowing them to search the web in complete private mode.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/startpage-private-search/'
license=('GPL-3.0')
depends=('firefox')
_source_file_id=4362482
source=('startpage.xpi'::"https://addons.mozilla.org/firefox/downloads/file/${_source_file_id}/startpage_private_search-${pkgver}.xpi")
noextract=('startpage.xpi')
sha256sums=('d0e0008bd76bc7c5edd89998940e4c8a75f17c391af938ba933be7dd2a8e1414')

package() {
  install -Dm644 'startpage.xpi' "${pkgdir}/usr/lib/firefox/browser/extensions/Startpage@startpage.com.xpi"
}
