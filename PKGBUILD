# Maintainer: kuba09 <kuba09 at pm dot me>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.10.0
pkgrel=1
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('b5c05317beef115b31eac2a76eafc58ef01c086e62afca676fcae22276a38987a9020a94f9964c17d9416a36863ebe6c14d67dd3898a34ae2bf272c89400ad1b')
sha512sums_x86_64=('e46728df2308089e2ac76fcda98be11c0c983e6b9c75b06251e63cab15b294b73aa3e2dc1abbd8dd19aa8768a9841915750f083f515ee67295182adf2cf601bd')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"

  install -Dm755 "${pkgdir}/usr/local/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
