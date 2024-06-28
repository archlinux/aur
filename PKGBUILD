# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="neonmodem"
pkgname="${_pkgname}-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc="A BBS-style, multi-backend discussion board TUI"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/mrusme/${_pkgname}"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('ce2213d40439899e41604ac10cdd74076b944ae21af8ac5edc3fd8c383835198')
sha256sums_i686=('7aaea6f263e019e1c2b8b37a3aad24f44ed120f636058884f5abf9e34745ff1f')
sha256sums_aarch64=('5fafaf8d1575f6e529eea7b00c32d8bd41d1d5053ff42cef5fbfa055cf2d1d39')
sha256sums_armv6h=('44818e9cffd01de9fd48952cd4c4699da7be7fc8e23b0547e086b6c8e465acbb')
sha256sums_armv7h=('b9a031fac3fc810ff0b94a543a1271f5f6ff27ad056c40f51d674651c874da0d')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
