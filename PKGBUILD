pkgname=rimilo-bin
_pkgname=rimilo
pkgver=0.2.8
pkgrel=1
pkgdesc='Rapida rimvort-serĉilo por Esperanto-angla vortaro'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/rimilo'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cc54ff587c86c3791c6cb0786930d4bd1bee931d408e29fe985c897575362883')
sha256sums_aarch64=('3a86a0843634ad8de9240c33761b31615815c6d4dbf3d6fbc0cfc4b929b49ab5')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
