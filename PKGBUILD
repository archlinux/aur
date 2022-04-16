# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)

_pkgname=impregnate
pkgname=impregnate-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="Official installer for Discord client mod 'Cumcord'"
arch=(x86_64 i686)
url="https://github.com/Cumcord/Impregnate"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("impregnate::https://github.com/Cumcord/Impregnate/releases/download/v${pkgver}/impregnate.Linux"
        "${_pkgname}.desktop")
sha256sums=('84f0477e1a03762113e8b3649fd19064063f4162746fae3bf1a0eedf3bb5f192'
            '2ea207f5aa2b1dfd62f3919467f556e9693dc8d0ba57a0c1e9f5b25f0a1c2d6f')


package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
