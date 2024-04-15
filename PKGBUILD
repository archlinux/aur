# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-addon-3do
_pkgname=uqm-megamod
pkgver=0.8.3
_pkgver=0.8.0
pkgrel=1
pkgdesc="3do voice, video and music package for the Ur-Quan Masters MegaMod by JHGuitarFreak (Kohr-Ah Death)."
arch=("any")
url="https://sourceforge.net/projects/uqm-mods/"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-3dovoice.uqm::https://gigenet.dl.sourceforge.net/project/uqm-mods/MegaMod/${pkgver}/Content/mm-${pkgver}-3dovoice.uqm"
  "uqm-${_pkgver}-3dovideo.uqm::https://cytranet.dl.sourceforge.net/project/uqm-mods/MegaMod/${pkgver}/Content/uqm-${_pkgver}-3dovideo.uqm"
  "uqm-${_pkgver}-3DOMusicRemastered.uqm::https://cytranet.dl.sourceforge.net/project/uqm-mods/MegaMod/${pkgver}/Content/uqm-${_pkgver}-3DOMusicRemastered.uqm"
  "mm-${pkgver}-3domode.uqm::https://sourceforge.net/projects/uqm-mods/files/MegaMod/${pkgver}/Content/mm-${pkgver}-3domode.uqm"
  LICENSE
)

md5sums=(
  "891f24a5392cdc6c69c456833307b559"
  "8412ced77245d2f6cac31feee6df05c6"
  "293a8b036746bcee3823f0b33c2a16a7"
  "9a7ff8b60984a17c8266ddd856e9ca32"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=(
  "mm-${pkgver}-3dovoice.uqm"
  "uqm-${_pkgver}-3dovideo.uqm"
  "uqm-${_pkgver}-3DOMusicRemastered.uqm"
)

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-3dovoice.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-3dovoice.uqm"
  install -Dm644 "${srcdir}/uqm-${_pkgver}-3dovideo.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/uqm-${_pkgver}-3dovideo.uqm"
  install -Dm644 "${srcdir}/uqm-${_pkgver}-3DOMusicRemastered.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/uqm-${_pkgver}-3DOMusicRemastered.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
