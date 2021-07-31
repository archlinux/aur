# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-nb-no
pkgver=2.53.8.1
pkgrel=1
_lang=nb-NO
pkgdesc="Norwegian (Bokmal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('4b696e153b78f36548aac58d5ce238755238b37c4217f186443f44c14dde58b59d77088467909d15948d6d48f19d0d17a868fd642b7a7c5902fa1ada60ae85fe')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
