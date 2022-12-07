# Maintainer: kuba09 <kuba09 at pm dot me>
pkgname=sampctl-bin
_pkgname=sampctl
pkgver=1.11.0
pkgrel=3
pkgdesc="Collection of tools for SA-MP developers"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Southclaws/sampctl"
license=('GPL3')
provides=('sampctl')

sha512sums_i686=('1311cde01a021aef0c806f1057fddda5934dad4e18ae60f9e22aca7fa6e20940f4fd3d449227a13863f5a13feea19552e6d23e6db322652f518e535981814a24')
sha512sums_x86_64=('3624bbc569dd1c767c66440d8a9a68c2001a32afe725f0261d05e861219e7a3335088813d3a857449326003847be08070adbfdfc00b7105c5fb549715c3a79fd')
sha512sums_aarch64=('1df5b9faef4b8654013203560f71fda536339bd5812ac41ddf49e9a9daa9035ad7de0c8bfb8a95aeb2a85e3b4d5b5bd0dc955387f46aa507c470b49e0d3ba5d6')

source_i686=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_386.deb")
source_x86_64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/Southclaws/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_arm64.deb")

package() {
  tar -xzf data.tar.gz -C "${srcdir}"

  install -Dm 755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
