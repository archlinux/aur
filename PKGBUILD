# Maintainer: Voxan24 <admin at hessfr dot fr>

pkgname=seamonkey-i18n-nl
pkgver=2.53.23
pkgrel=1
_lang=nl
pkgdesc="Dutch language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(https://archive.seamonkey-project.org/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)
sha512sums=('54b1b3c396ffb59bce0f7f14c3684a63eef9ae2a1e4fe5b6c052094a1243fc74636c62a45a70444af253f41a2655a79b1dc9e937ab73c73fd382b775e55cdf3e')

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}
