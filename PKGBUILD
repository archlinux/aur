# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-fr
pkgver=2.53.12
pkgrel=1
_lang=fr
pkgdesc="French language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('928e76d57acfb5b7d58313283a39beb755472de283122000c0ff453eebccbdd9bac59d89778e195c13a787139670fb83b22977468edd8b83b780f3716df626cd')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
