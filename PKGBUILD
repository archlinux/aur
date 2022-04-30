# Maintainer: cocatrip <cocatrip[at]yahoo[dot]com>

pkgname=jaksel-language
pkgver=1.1.0
pkgrel=1
pkgdesc="Jaksel Script, Programming language very modern and Indonesian style"
url="https://github.com/RioChndr/jaksel-language"
arch=('any')
license=('MIT')
depends=()
makedepends=('npm')
source=(
  "https://github.com/RioChndr/jaksel-language/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  "6cc1c4cda795e15d58b2cc1255341e26f644b53db5e2a08b089b16987f2b423a"
)

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"
}
