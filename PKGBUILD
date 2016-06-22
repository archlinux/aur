# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname="firefox-jsprintsetup"
pkgver='0.9.5.3'
pkgrel='1'
pkgdesc='Client side Javascript printer settings. This extension implements print setup from CS Javascript'
arch=('any')
url="https://github.com/edabg/jsprintsetup"
license=('MPL')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/8966/addon-8966-latest.xpi?src=dp-btn-primary")
sha256sums=('1ce31dd3451b4fa5e616d16e8cbdae8fa00dbf1b21c1c14ded9cdf0d542e2664')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/jsprintsetup@edabg.com.xpi"
  popd
}
