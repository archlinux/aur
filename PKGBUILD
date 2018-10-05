# Maintainer: Martin Minka <martin.minka@gmail.com>

_fontname=sans-forgetica
pkgname=otf-${_fontname}
pkgver=0.1
_relver=0.1
pkgrel=2
pkgdesc="Font scientifically designed to help you remember your study notes"
url="http://sansforgetica.rmit/"
arch=(any)
license=(custom)
source=("$_fontname.zip::http://sansforgetica.rmit/Common/Zips/Sans%20Forgetica.zip")
sha256sums=('972899e17ae7097c95a30661c882c696b6f17d73061da6632b8e976b3bf56f81')
makedepends=('unzip')

package() {
  cd "${srcdir}"
  unzip -qqo "${_fontname}.zip"
  cd "Sans Forgetica"

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}

# vim:set ts=2 sw=2 et:
