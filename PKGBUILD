# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-pt-pt
pkgver=2.53.5
pkgrel=2
_lang=pt-PT
pkgdesc="Portuguese (Portugal) language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('f4af9f6fdfc3d42d3554bdae548761f35fb7b263db696b0b9876f237783fbc2ff6e5fdc514e58da6996349254fceb58baf6964684f7f6092058a58858f69b5e1')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
