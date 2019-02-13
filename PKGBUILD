# Maintainer: kuba09 <kuba09 at protonmail dot com>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.8.37
pkgrel=1
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('07ba7abb8c5f084df330aa1bb1e880ccb46ef1806978ad7fff4ea5a9cff9d2bdae4226cb092a7a8c722587d1941dab0c0215a026b17f184b719d2b05e27a5b05')
sha512sums_x86_64=('0900d551121cc0da97d78bad4569f6cb7369b6e7845d97edca75528bc958061768bebcf8eb13fd77b66c35e79016be7a5c4c2262e77e3757bd7827b590e88fe8')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"

  install -Dm755 "${pkgdir}/usr/local/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
