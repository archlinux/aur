# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="manssh"
pkgname="${_pkgname}-bin"
pkgver=0.5.3
pkgrel=1
pkgdesc="Manage your ssh alias configs easily"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/xwjdsh/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4b849f7df06087e4c2c64b6a680c5b50738fe31f53593f8263ac243bedf12025')
sha256sums_i686=('5c2e449a980fd60156b8107416849eb973ce9c5369fccca5c7ffdc05d912b27c')
sha256sums_aarch64=('6b965d9f6012c43220f2804a3a7cb9cec59c7603d7edde65b6780beeb6f38ac0')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
