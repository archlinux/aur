# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname="firefox-jsprintsetup"
pkgver='0.9.5.1'
pkgrel='1'
pkgdesc='Client side Javascript printer settings. This extension implements print setup from CS Javascript'
arch=('any')
url="https://github.com/edabg/jsprintsetup"
license=('MPL')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/8966/addon-8966-latest.xpi?src=dp-btn-primary")
sha256sums=('d485f5a3413f4f806f0c27f8e4e417b0ebd7ff91ade8ec2c0e4d2c7e1feefb81')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/jsprintsetup@edabg.com.xpi"
  popd
}
