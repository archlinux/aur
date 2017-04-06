# Maintainer: Charlie Wolf <charlie@wolf.is>

pkgname=firefox-searchengine-ddghtml
pkgver=1.0
pkgrel=1
pkgdesc="Firefox french DuckDuckGo search engine"
arch=('any')
url="http://duckduckgo.com/"
license=('GPL')
depends=("firefox")
source=(search-duckduckgo-ssl-html.xml)
sha512sums=('6fe3dc1ca1583a7d192b8e5c7984029d3228fa95fb01a0e797583fe2e284c17b25f173524d062614e79a91d6fc47bae7f4035a8cedc72367cf5ee51c491916eb')
validpgpkeys=('3C82931F90299B5DBCC9088B65714E0A9FA612B2')

package() {
  install -D -m 0644 "${srcdir}"/search-duckduckgo-ssl-html.xml "${pkgdir}"/usr/lib/firefox/distribution/searchplugins/common/search-duckduckgo-ssl-html.xml
}
