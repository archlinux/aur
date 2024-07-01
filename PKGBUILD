# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="calories"
pkgname="${_pkgname}-bin"
pkgver=1.1.1
pkgrel=1
pkgdesc="Calories Tracker for the Commandline"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/zupzup/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/${pkgver}/calories_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/${pkgver}/calories_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/calories_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('37c4052f330779757647df129fa5d2f1261f9597fa1fe1b28c3260c70f558d31')
sha256sums_i686=('11be480d69c36a0592811b6dd8903c680237e280c6e45b7bc1e746262932939d')
sha256sums_aarch64=('a4f56000d32f6736afe1a1f4cac89c428d42d18f750a9092edf0d8e65bf527d7')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
