# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname="firefox-jsprintsetup"
pkgver='0.9.5.5'
pkgrel='1'
pkgdesc='Client side Javascript printer settings. This extension implements print setup from CS Javascript'
arch=('any')
url="https://github.com/edabg/jsprintsetup"
license=('MPL')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/8966/addon-8966-latest.xpi?src=dp-btn-primary")
sha256sums=('2e16f6743ed725bfd9d1625979d798ee08cab17c069c3ecd95338e4ded0ce190')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/jsprintsetup@edabg.com.xpi"
}
