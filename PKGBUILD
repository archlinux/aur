# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-cs
pkgver=2.53.23
pkgrel=1
_lang=cs
pkgdesc="Czech language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('94e1d98d445e1524da946755bd383dbf173dd3018f7ca48267d9f278fb7c5524faddf6ccc9182f0a8e545905821d900494a714c6eec56ca45c4cbe3ca23686e8')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
