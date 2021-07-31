# Maintainer: 3ED <krzysztof1987 at gmail>

pkgname=seamonkey-i18n-cs
pkgver=2.53.8.1
pkgrel=1
_lang=cs
pkgdesc="Czech language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://ftp.mozilla.org/pub/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('016d4879ef7c7f9ed4e33dfc55c227f5ee8cf1ce5e12b76b57304a6c0d90926e8a08edb87b86b499ae09ab6ec58a5a164f5940eedae1f6a8d0b3e2cd343f3cd5')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
